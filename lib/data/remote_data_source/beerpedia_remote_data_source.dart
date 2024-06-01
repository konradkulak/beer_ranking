import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BeerpediaRemoteDataSource {
  late Dio _dio;

  BeerpediaRemoteDataSource() {
    String? apiHost = dotenv.env['API_HOST'];
    String? apiKey = dotenv.env['API_KEY'];

    if (apiHost == null || apiKey == null) {
      throw Exception('API_HOST or API_KEY is not set in .env file');
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://$apiHost',
        headers: {
          'API-Key': apiKey,
        },
      ),
    );
  }

  String encodeQuery(String query) {
    return Uri.encodeComponent(query);
  }

  Future<List<dynamic>?> getBeerpediaData(String title) async {
    String encodedTitle = encodeQuery(title);
    try {
      final response =
          await _dio.get('/beers', queryParameters: {'title': encodedTitle});
      if (response.statusCode == 200 && response.data is List) {
        var filteredData = (response.data as List).where((element) {
          return element['title']
              .toString()
              .toLowerCase()
              .contains(title.toLowerCase());
        }).toList();
        if (filteredData.isNotEmpty) {
          return filteredData;
        } else {
          throw Exception('No matching data found');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } on DioException catch (error) {
      if (error.response != null) {
        throw Exception(
            'Network error: ${error.response?.statusCode} ${error.message}');
      } else {
        throw Exception('Network error without response: ${error.message}');
      }
    } catch (error) {
      throw Exception('Unexpected error: ${error.toString()}');
    }
  }
}
