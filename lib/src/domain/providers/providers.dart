import 'package:blott_mobile_assesment/src/data/datasource/remote/api_services.dart';
import 'package:blott_mobile_assesment/src/data/repositories_impl/api_repository_impl.dart';
import 'package:blott_mobile_assesment/src/domain/repositories/api_repository.dart';
import 'package:blott_mobile_assesment/src/presentation/screens/home/home_viewmodel.dart';
import 'package:blott_mobile_assesment/src/presentation/states/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = Dio();
  return ApiService(dio);
});

final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  final apiServices = ref.watch(apiServiceProvider);
  return ApiRepositoryImpl(apiServices);
});

final homeViewmodelProvider =
    StateNotifierProvider<HomeViewmodel, HomeState>((ref) {
  final apiRepository = ref.watch(apiRepositoryProvider);
  return HomeViewmodel(apiRepository);
});
