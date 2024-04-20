import 'dart:async';

import 'package:beer_ranking/domain/models/home_model.dart';
import 'package:beer_ranking/domain/repositories/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeState([]));

  final HomeRepository _homeRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _homeRepository.getHomeStream().listen((items) {
      emit(HomeState(items));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
