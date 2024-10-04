import 'package:blott_mobile_assesment/src/core/constants/app_env.dart';
import 'package:blott_mobile_assesment/src/core/enums/state_enum.dart';
import 'package:blott_mobile_assesment/src/data/datasource/local/local_storage.dart';
import 'package:blott_mobile_assesment/src/data/resources/data_state.dart';
import 'package:blott_mobile_assesment/src/domain/repositories/api_repository.dart';
import 'package:blott_mobile_assesment/src/presentation/states/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewmodel extends StateNotifier<HomeState> {
  final ApiRepository _apiRepository;

  HomeViewmodel(this._apiRepository) : super(HomeState.initial());

  void setFirstName() async {
    final name = await LocalStorage().readData('firstName');
    state = state.copyWith(firstName: name);
  }

  Future<void> getNews() async {
    state = state.copyWith(loadingState: LoadingState.loading);
    final response = await _apiRepository.getNews('general', AppEnv.apiKey);

    if (response is DataSuccess) {
      state = state.copyWith(
        loadingState: LoadingState.loaded,
        news: response.data,
      );
    } else {
      state = state.copyWith(
        loadingState: LoadingState.error,
        errorMesssage: response.error?.response?.data['message'] ??
            'Something went wrong. Please try again later.',
      );
    }
  }
}
