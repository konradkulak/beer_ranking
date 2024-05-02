import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

class BeerpediaRemoteDataSource {
  late Dio _dio;

  BeerpediaRemoteDataSource() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://beers-list.p.rapidapi.com',
        headers: {
          'X-RapidAPI-Key': FlutterConfig.get('API_KEY'),
          'X-RapidAPI-Host': 'beers-list.p.rapidapi.com',
        },
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
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
