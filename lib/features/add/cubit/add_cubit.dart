import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:bloc/bloc.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._beerRepository) : super(AddState());

  final BeerRepository _beerRepository;

  Future<void> addItem(BeerModel beer) async {
    emit(
      AddState(
        addStatus: AddStatus.loading,
      ),
    );
    try {
      await _beerRepository.addItem(beer);
      emit(
        AddState(
          addStatus: AddStatus.success,
        ),
      );
    } catch (error) {
      emit(
        AddState(
          addStatus: AddStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
