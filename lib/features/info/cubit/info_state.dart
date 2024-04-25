part of 'info_cubit.dart';

class InfoState {
  InfoState({
    this.beer,
    this.infoStatus,
    this.errorMessage,
  });

  final BeerModel? beer;
  final InfoStatus? infoStatus;
  final String? errorMessage;
}
