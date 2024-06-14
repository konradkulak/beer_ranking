import 'package:beer_ranking/data/remote_data_source/auth_remote_data_source.dart';
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/cubit/add_cubit.dart';
import 'package:beer_ranking/features/auth/cubit/auth_cubit.dart';
import 'package:beer_ranking/features/home/cubit/home_cubit.dart';
import 'package:beer_ranking/features/info/cubit/info_cubit.dart';
import 'package:beer_ranking/features/user/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //Data Sources
  getIt.registerFactory(() => BeerRemoteDataSource());
  getIt.registerFactory(() => AuthRemoteDataSource());

  //Repositories
  getIt.registerFactory(() => BeerRepository(getIt<BeerRemoteDataSource>()));
  getIt.registerFactory(() => AuthRepository(getIt<AuthRemoteDataSource>()));

  //Bloc
  getIt.registerFactory(() => AddCubit(getIt<BeerRepository>()));
  getIt.registerFactory(() => HomeCubit(getIt<BeerRepository>()));
  getIt.registerFactory(() => InfoCubit(getIt<BeerRepository>()));

  getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory(() => UserCubit(getIt<AuthRepository>()));
}
