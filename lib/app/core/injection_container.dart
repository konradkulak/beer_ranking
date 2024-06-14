import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/cubit/add_cubit.dart';
import 'package:beer_ranking/features/home/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //Data Sources
  getIt.registerFactory(() => BeerRemoteDataSource());

  //Repositories
  getIt.registerFactory(() => BeerRepository(getIt<BeerRemoteDataSource>()));

  //Bloc
  getIt.registerFactory(() => AddCubit(getIt<BeerRepository>()));
  getIt.registerFactory(() => HomeCubit(getIt<BeerRepository>()));
}
