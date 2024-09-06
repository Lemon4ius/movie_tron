// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/detail_screen/data/api/detail_api.dart' as _i971;
import '../../features/detail_screen/data/repo_impl/detail_repo_impl.dart'
    as _i549;
import '../../features/detail_screen/domain/repository/detail_repository.dart'
    as _i733;
import '../../features/home_screen/data/api/get_popular_films_api.dart'
    as _i1053;
import '../../features/home_screen/data/repo_impl/home_repo_impl.dart' as _i451;
import '../../features/home_screen/domain/repository/home_repository.dart'
    as _i499;
import '../../features/home_screen/presentation/bloc/home_bloc.dart' as _i285;

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
    gh.factory<_i971.DetailApi>(() => _i971.DetailApi());
    gh.factory<_i1053.DetailApi>(() => _i1053.DetailApi());
    gh.factory<_i285.HomeBloc>(() => _i285.HomeBloc());
    gh.factory<_i499.HomeRepository>(() => _i451.HomeRepoImpl());
    gh.factory<_i733.DetailRepository>(() => _i549.DetailRepoImpl());
    return this;
  }
}
