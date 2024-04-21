import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:bloc/bloc.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddState());
}
