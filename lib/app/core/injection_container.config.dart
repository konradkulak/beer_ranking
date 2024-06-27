// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:beer_ranking/app/core/injection_container.dart' as _i16;
import 'package:beer_ranking/data/remote_data_source/auth_remote_data_source.dart'
    as _i3;
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart'
    as _i4;
import 'package:beer_ranking/data/remote_data_source/beerpedia_remote_data_source.dart'
    as _i11;
import 'package:beer_ranking/domain/repositories/auth_repository.dart' as _i5;
import 'package:beer_ranking/domain/repositories/beer_repository.dart' as _i6;
import 'package:beer_ranking/domain/repositories/beerpedia_repository.dart'
    as _i14;
import 'package:beer_ranking/features/add/cubit/add_cubit.dart' as _i10;
import 'package:beer_ranking/features/auth/cubit/auth_cubit.dart' as _i12;
import 'package:beer_ranking/features/beerpedia/cubit/beerpedia_cubit.dart'
    as _i15;
import 'package:beer_ranking/features/home/cubit/home_cubit.dart' as _i8;
import 'package:beer_ranking/features/info/cubit/info_cubit.dart' as _i9;
import 'package:beer_ranking/features/user/cubit/user_cubit.dart' as _i13;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AuthRemoteDataSource>(() => _i3.AuthRemoteDataSource());
    gh.factory<_i4.BeerRemoteDataSource>(() => _i4.BeerRemoteDataSource());
    gh.factory<_i5.AuthRepository>(
        () => _i5.AuthRepository(gh<_i3.AuthRemoteDataSource>()));
    gh.factory<_i6.BeerRepository>(
        () => _i6.BeerRepository(gh<_i4.BeerRemoteDataSource>()));
    gh.lazySingleton<_i7.Dio>(() => registerModule.dio(
          gh<String>(instanceName: 'BaseUrl'),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.factory<_i8.HomeCubit>(() => _i8.HomeCubit(gh<_i6.BeerRepository>()));
    gh.factory<_i9.InfoCubit>(() => _i9.InfoCubit(gh<_i6.BeerRepository>()));
    gh.factory<_i10.AddCubit>(() => _i10.AddCubit(gh<_i6.BeerRepository>()));
    gh.factory<_i11.BeerpediaRemoteDataSource>(
        () => _i11.BeerpediaRemoteDataSource(gh<_i7.Dio>()));
    gh.factory<_i12.AuthCubit>(() => _i12.AuthCubit(gh<_i5.AuthRepository>()));
    gh.factory<_i13.UserCubit>(() => _i13.UserCubit(gh<_i5.AuthRepository>()));
    gh.factory<_i14.BeerpediaRepository>(
        () => _i14.BeerpediaRepository(gh<_i11.BeerpediaRemoteDataSource>()));
    gh.factory<_i15.BeerpediaCubit>(
        () => _i15.BeerpediaCubit(gh<_i14.BeerpediaRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
