import 'package:dio/dio.dart';

class BeerpediaRemoteDataSource {
  late Dio _dio;

  BeerpediaRemoteDataSource() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://beers-list.p.rapidapi.com', headers: {
        'X-RapidAPI-Key': 'ca6d4587c0msh615181cdbec7b83p1d0716jsn74c6e7a341c6',
        'X-RapidAPI-Host': 'beers-list.p.rapidapi.com',
      }),
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
      throw Exception('Network error: ${error.message}');
    }
  }
}
