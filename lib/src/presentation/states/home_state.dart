import 'package:blott_mobile_assesment/src/core/enums/state_enum.dart';
import 'package:blott_mobile_assesment/src/data/model/news_model.dart';

class HomeState {
  final LoadingState loadingState;
  final List<NewsModel> news;
  final String? firstName;
  final String? errorMesssage;

  HomeState({
    required this.loadingState,
    required this.news,
    this.firstName,
    this.errorMesssage,
  });

  HomeState copyWith({
    LoadingState? loadingState,
    List<NewsModel>? news,
    String? firstName,
    String? errorMesssage,
  }) {
    return HomeState(
      loadingState: loadingState ?? this.loadingState,
      news: news ?? this.news,
      firstName: firstName ?? this.firstName,
      errorMesssage: errorMesssage ?? this.errorMesssage,
    );
  }

  HomeState.initial()
      : loadingState = LoadingState.initial,
        news = [],
        firstName = null,
        errorMesssage = null;
}
