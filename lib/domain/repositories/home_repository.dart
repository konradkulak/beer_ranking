import 'package:beer_ranking/data/remote_data_source/home_remote_data_source.dart';
import 'package:beer_ranking/domain/models/home_model.dart';

class HomeRepository {
  HomeRepository(this._homeRemoteDataSource);

  final HomeRemoteDataSource _homeRemoteDataSource;

  Stream<List<HomeModel>> getHomeModel() {
    return _homeRemoteDataSource.getHomeStream().map(
          (dataList) => dataList.map(
            (data) {
              return HomeModel.fromMap(data);
            },
          ).toList(),
        );
  }
}
