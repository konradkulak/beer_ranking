import 'package:beer_ranking/app/core/injection_container.config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await dotenv.load();

  getIt.registerSingleton<String>(dotenv.env['API_HOST']!,
      instanceName: 'BaseUrl');
  getIt.registerSingleton<String>(dotenv.env['API_KEY']!,
      instanceName: 'ApiKey');

  getIt.init();
}

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio(
    @Named('BaseUrl') String baseUrl,
    @Named('ApiKey') String apiKey,
  ) {
    return Dio(
      BaseOptions(
        baseUrl: 'https://$baseUrl',
        headers: {
          'API-Key': apiKey,
        },
      ),
    );
  }
}
