import 'package:beer_ranking/data/remote_data_source/beerpedia_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beerpedia_model.dart';

class BeerpediaRepository {
  BeerpediaRepository(this._beerpediaRemoteDataSource);

  final BeerpediaRemoteDataSource _beerpediaRemoteDataSource;

  Future<BeerpediaModel?> getBeerpediaModel({
    required String title,
  }) async {
    final json = await _beerpediaRemoteDataSource.getBeerpediaData(title);

    if (json == null) {
      return null;
    }
    Map<String, dynamic> data;
    if (json.isNotEmpty) {
      data = json.first as Map<String, dynamic>;
    } else {
      return null;
    }
    return BeerpediaModel.fromJson(data);
  }
}
