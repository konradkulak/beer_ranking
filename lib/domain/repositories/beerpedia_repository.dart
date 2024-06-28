import 'package:beer_ranking/data/remote_data_source/beerpedia_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beerpedia_model.dart';

class BeerpediaRepository {
  BeerpediaRepository(this._beerpediaRemoteDataSource);

  final BeerpediaRemoteDataSource _beerpediaRemoteDataSource;

  Future<BeerpediaModel?> getBeerpediaModel({
    required String title,
  }) async {
    try {
      final data = await _beerpediaRemoteDataSource.getBeerpediaData(title);
      if (data.isEmpty) {
        return null;
      }
      var filteredData = data
          .where(
              (element) => element.title.toLowerCase() == title.toLowerCase())
          .toList();
      if (filteredData.isNotEmpty) {
        return filteredData.first;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
