// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:playground/core/di/injectable.dart' as _i10;
import 'package:playground/core/services/api_service_impl.dart' as _i6;
import 'package:playground/data/services/api/users_api_impl.dart' as _i8;
import 'package:playground/data/services/api_service.dart' as _i5;
import 'package:playground/domain/contracts/users_api.dart' as _i7;
import 'package:playground/domain/mappers/user_mapper.dart' as _i3;
import 'package:playground/domain/repositories/user_repository.dart' as _i9;

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
    gh.factory<_i3.UserMapper>(() => _i3.UserMapper());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i4.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i5.ApiService>(() => _i6.ApiServiceImpl(gh<_i4.Dio>()));
    gh.lazySingleton<_i7.UsersApi>(
        () => _i8.UsersApiImpl(gh<_i5.ApiService>()));
    gh.factory<_i9.UserRepository>(() => _i9.UserRepository(
          gh<_i7.UsersApi>(),
          gh<_i3.UserMapper>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
