part of 'add_cubit.dart';

class AddState {
  AddState({
    this.beer,
    this.addStatus,
    this.errorMessage,
  });

  final BeerModel? beer;
  final AddStatus? addStatus;
  final String? errorMessage;
}
