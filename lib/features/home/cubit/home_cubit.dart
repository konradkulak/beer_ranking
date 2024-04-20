import 'dart:async';

import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/home_model.dart';
import 'package:beer_ranking/domain/repositories/home_repository.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeState());

  final HomeRepository _homeRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      HomeState(status: Status.loading),
    );
    _streamSubscription = _homeRepository.getHomeModel().listen((items) {
      emit(
        HomeState(
          items: items,
          status: Status.success,
        ),
      );
    }, onError: (error) {
      emit(
        HomeState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
