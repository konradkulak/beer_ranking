part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.items = const [],
    this.status = Status.initial,
    this.deletionStatus,
    this.errorMessage,
  });

  final List<BeerModel> items;
  final Status status;
  final DeletionStatus? deletionStatus;
  final String? errorMessage;
}
