import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';

class BeerRepository {
  BeerRepository(this._beerRemoteDataSource);

  final BeerRemoteDataSource _beerRemoteDataSource;

  Stream<List<BeerModel>> getBeerModel() {
    return _beerRemoteDataSource.getBeerStream().map(
          (dataList) => dataList.map(
            (data) {
              return BeerModel.fromMap(data);
            },
          ).toList(),
        );
  }

  Future<void> deleteItem(String id) async {
    await _beerRemoteDataSource.deleteItem(id);
  }

  Future<void> addItem(BeerModel beer) async {
    await _beerRemoteDataSource.addItem(beer);
  }
}
