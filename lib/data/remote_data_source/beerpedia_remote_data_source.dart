import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  RetryOnConnectionChangeInterceptor(this.dio);

  final Dio dio;

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        return handler.resolve(
          await dio.request(
            err.requestOptions.path,
            cancelToken: err.requestOptions.cancelToken,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
            onReceiveProgress: err.requestOptions.onReceiveProgress,
          ),
        );
      } catch (e) {
        return handler.next(err);
      }
    }
    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type != DioExceptionType.connectionTimeout &&
        err.type != DioExceptionType.receiveTimeout &&
        err.error != null &&
        err.error is SocketException;
  }
}

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
    _dio.interceptors.add(RetryOnConnectionChangeInterceptor(_dio));
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
