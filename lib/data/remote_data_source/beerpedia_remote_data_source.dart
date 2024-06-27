import 'package:beer_ranking/domain/models/beerpedia_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'beerpedia_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class BeerpediaRemoteDataSource {
  @factoryMethod
  factory BeerpediaRemoteDataSource(Dio dio) =
      _BeerpediaRemoteDataSource;

  @GET('/beers')
  Future<List<BeerpediaModel>> getBeerpediaData(@Query('title') String title);
}

class BeerpediaService {
  final BeerpediaRemoteDataSource _dataSource;

  BeerpediaService(this._dataSource);

  String encodeQuery(String query) {
    return Uri.encodeComponent(query);
  }

  Future<List<BeerpediaModel>> getBeerpediaData(String title) async {
    String encodedTitle = encodeQuery(title);
    try {
      final response = await _dataSource.getBeerpediaData(encodedTitle);
      if (response.isNotEmpty) {
        return response;
      } else {
        throw Exception('No data received from API');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          throw Exception(
              'Network error: ${error.response?.statusCode} ${error.message}');
        } else {
          throw Exception('Network error without response: ${error.message}');
        }
      } else {
        throw Exception('Unexpected error: ${error.toString()}');
      }
    }
  }
}
