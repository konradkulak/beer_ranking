part of 'beerpedia_cubit.dart';

class BeerpediaState {
  BeerpediaState(
      {this.beerpediaModel,
      this.beerpediaStatus = BeerpediaStatus.initial,
      this.errorMessage});

  final BeerpediaModel? beerpediaModel;
  final BeerpediaStatus beerpediaStatus;
  final String? errorMessage;
}
