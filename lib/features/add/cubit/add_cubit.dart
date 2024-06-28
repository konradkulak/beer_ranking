import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_state.dart';
part 'add_cubit.g.dart';
part 'add_cubit.freezed.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._beerRepository) : super(const AddState());

  final BeerRepository _beerRepository;

  Future<void> addItem(BeerModel beer) async {
    emit(
      const AddState(
        addStatus: AddStatus.loading,
      ),
    );
    try {
      await _beerRepository.addItem(beer);
      emit(
        const AddState(
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
