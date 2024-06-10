import 'dart:async';
import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.g.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._beerRepository)
      : super(const HomeState(items: [], status: Status.initial));

  final BeerRepository _beerRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const HomeState(
        status: Status.loading,
        items: [],
      ),
    );
    _streamSubscription = _beerRepository.getBeerModel().listen(
      (items) {
        emit(
          HomeState(
            items: items,
            status: Status.success,
          ),
        );
      },
      onError: (error) {
        emit(
          HomeState(
            items: [],
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  Future<void> deleteItem(String id) async {
    try {
      await _beerRepository.deleteItem(id);
      List<BeerModel> updatedItems =
          state.items.where((item) => item.id != id).toList();
      emit(
        HomeState(
          items: updatedItems,
          status: Status.success,
          deletionStatus: DeletionStatus.success,
        ),
      );
    } catch (error) {
      emit(
        HomeState(
          items: state.items,
          status: state.status,
          deletionStatus: DeletionStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
