import 'package:beer_ranking/data/remote_data_source/beerpedia_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beerpedia_model.dart';

class BeerpediaRepository {
  BeerpediaRepository(this._beerpediaRemoteDataSource);

  final BeerpediaRemoteDataSource _beerpediaRemoteDataSource;

  Future<BeerpediaModel?> getBeerpediaModel({
    required String beer,
  }) async {
    final json = await _beerpediaRemoteDataSource.getBeerpediaData(beer: beer);

    if (json == null) {
      return null;
    }
    return BeerpediaModel.fromJson(json);
  }
}
