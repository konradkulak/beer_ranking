import 'package:beer_ranking/data/remote_data_source/auth_remote_data_source.dart';
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/data/remote_data_source/beerpedia_remote_data_source.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/domain/repositories/beerpedia_repository.dart';
import 'package:beer_ranking/features/add/cubit/add_cubit.dart';
import 'package:beer_ranking/features/auth/cubit/auth_cubit.dart';
import 'package:beer_ranking/features/beerpedia/cubit/beerpedia_cubit.dart';
import 'package:beer_ranking/features/home/cubit/home_cubit.dart';
import 'package:beer_ranking/features/info/cubit/info_cubit.dart';
import 'package:beer_ranking/features/user/cubit/user_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
//Dio
  String? apiHost = dotenv.env['API_HOST'];
  String? apiKey = dotenv.env['API_KEY'];

  if (apiHost == null || apiKey == null) {
    throw Exception('API_HOST or API_KEY is not set in .env file');
  }

  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://$apiHost',
        headers: {
          'API-Key': apiKey,
        },
      ),
    ),
  );

  //Data Sources
  getIt.registerFactory(() => BeerRemoteDataSource());
  getIt.registerFactory(() => AuthRemoteDataSource());
  getIt.registerFactory(() => BeerpediaRemoteDataSource(getIt<Dio>()));

  //Repositories
  getIt.registerFactory(() => BeerRepository(getIt<BeerRemoteDataSource>()));
  getIt.registerFactory(() => AuthRepository(getIt<AuthRemoteDataSource>()));
  getIt.registerFactory(
      () => BeerpediaRepository(getIt<BeerpediaRemoteDataSource>()));

  //Bloc
  getIt.registerFactory(() => AddCubit(getIt<BeerRepository>()));
  getIt.registerFactory(() => HomeCubit(getIt<BeerRepository>()));
  getIt.registerFactory(() => InfoCubit(getIt<BeerRepository>()));

  getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory(() => UserCubit(getIt<AuthRepository>()));

  getIt.registerFactory(() => BeerpediaCubit(getIt<BeerpediaRepository>()));
}
