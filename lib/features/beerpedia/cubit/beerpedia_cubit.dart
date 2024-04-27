import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beerpedia_model.dart';
import 'package:beer_ranking/domain/repositories/beerpedia_repository.dart';

import 'package:bloc/bloc.dart';

part 'beerpedia_state.dart';

class BeerpediaCubit extends Cubit<BeerpediaState> {
  BeerpediaCubit(this._beerpediaRepository) : super(BeerpediaState());

  final BeerpediaRepository _beerpediaRepository;

  Future<void> getBeerpediaModel({
    required String title,
  }) async {
    emit(BeerpediaState(beerpediaStatus: BeerpediaStatus.loading));
    try {
      final beerpediaModel =
          await _beerpediaRepository.getBeerpediaModel(title: title);
      emit(
        BeerpediaState(
            beerpediaModel: beerpediaModel,
            beerpediaStatus: BeerpediaStatus.success),
      );
    } catch (error) {
      emit(
        BeerpediaState(
          beerpediaStatus: BeerpediaStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
