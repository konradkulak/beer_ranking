import 'dart:convert';
import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'info_state.dart';
part 'info_cubit.g.dart';
part 'info_cubit.freezed.dart';

@injectable
class InfoCubit extends Cubit<InfoState> {
  InfoCubit(this._beerRepository)
      : super(
          const InfoState(
            imageStatus: ImageStatus.valid,
          ),
        );

  final BeerRepository _beerRepository;

  Future<void> getBeerID(String id) async {
    emit(
      const InfoState(
        infoStatus: InfoStatus.loading,
        imageStatus: ImageStatus.valid,
      ),
    );
    try {
      final BeerModel beer = await _beerRepository.getBeerID(id);
      ImageStatus imageStatus = ImageStatus.valid;

      if (beer.imageURL.isEmpty) {
        imageStatus = ImageStatus.missing;
      } else {
        try {
          if (beer.imageURL.startsWith('data:image')) {
            var parts = beer.imageURL.split(',');
            if (parts.length > 1) {
              base64.decode(parts[1]);
              imageStatus = ImageStatus.dataURI;
            } else {
              Uri.parse(beer.imageURL);
              imageStatus = ImageStatus.valid;
            }
          } else {
            Uri.parse(beer.imageURL);
          }
        } catch (error) {
          imageStatus = ImageStatus.malformed;
        }
      }
      emit(
        InfoState(
          beer: beer,
          infoStatus: InfoStatus.success,
          imageStatus: imageStatus,
        ),
      );
    } catch (error) {
      emit(
        InfoState(
          infoStatus: InfoStatus.error,
          errorMessage: error.toString(),
          imageStatus: ImageStatus.malformed,
        ),
      );
    }
  }
}
