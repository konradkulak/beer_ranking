import 'package:dio/dio.dart';

class BeerpediaRemoteDataSource {
  Future<Map<String, dynamic>?> getBeerpediaData({
    required String beer,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://beer-lover.p.rapidapi.com/search/beer/$beer?rapidapi-key=ca6d4587c0msh615181cdbec7b83p1d0716jsn74c6e7a341c6');
      return response.data;
    } on DioException catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unknown error');
    }
  }
}
