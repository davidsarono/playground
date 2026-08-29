// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:playground/core/di/injectable.dart' as _i261;
import 'package:playground/core/services/api_service_impl.dart' as _i439;
import 'package:playground/data/services/api/users_api_impl.dart' as _i982;
import 'package:playground/data/services/api_service.dart' as _i143;
import 'package:playground/domain/contracts/users_api.dart' as _i401;
import 'package:playground/domain/mappers/user_mapper.dart' as _i644;
import 'package:playground/domain/repositories/user_repository.dart' as _i330;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i644.UserMapper>(() => _i644.UserMapper());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i361.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i143.ApiService>(
        () => _i439.ApiServiceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i401.UsersApi>(
        () => _i982.UsersApiImpl(gh<_i143.ApiService>()));
    gh.factory<_i330.UserRepository>(() => _i330.UserRepository(
          gh<_i401.UsersApi>(),
          gh<_i644.UserMapper>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i261.RegisterModule {}
