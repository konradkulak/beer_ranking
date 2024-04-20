part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.items = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<HomeModel> items;
  final Status status;
  final String? errorMessage;
}
