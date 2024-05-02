part of 'info_cubit.dart';

class InfoState {
  InfoState({
    this.beer,
    this.infoStatus,
    this.imageStatus = ImageStatus.valid,
    this.errorMessage,
  });

  final BeerModel? beer;
  final InfoStatus? infoStatus;
  final ImageStatus imageStatus;
  final String? errorMessage;
}
