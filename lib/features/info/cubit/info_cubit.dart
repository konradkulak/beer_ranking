import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:bloc/bloc.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(this._beerRepository) : super(InfoState());

  final BeerRepository _beerRepository;

  Future<void> getBeerID(String id) async {
    emit(
      InfoState(
        infoStatus: InfoStatus.loading,
      ),
    );
    try {
      final BeerModel beer = await _beerRepository.getBeerID(id);
      emit(
        InfoState(
          beer: beer,
          infoStatus: InfoStatus.success,
        ),
      );
    } catch (error) {
      emit(
        InfoState(
          infoStatus: InfoStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
