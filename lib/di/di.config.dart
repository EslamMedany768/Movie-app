// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../data/data_source/remote_data_source_impl/home_remote_data_source_impl.dart'
    as _i285;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../domain/repositorty/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i810;
import '../domain/repositorty/repositories/home_repository.dart' as _i802;
import '../domain/use_cases/get_popular_movies_use_case.dart' as _i385;
import '../feature/home/tabs/1-home_screen/cubit/home_screen_view_model.dart'
    as _i1001;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i810.HomeRemoteDataSource>(
      () => _i285.HomeRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()),
    );
    gh.factory<_i802.HomeRepository>(
      () => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i810.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i385.GetPopularMoviesUseCase>(
      () => _i385.GetPopularMoviesUseCase(
        homeRepository: gh<_i802.HomeRepository>(),
      ),
    );
    gh.factory<_i1001.HomeScreenViewModel>(
      () => _i1001.HomeScreenViewModel(
        getPopularMoviesUseCase: gh<_i385.GetPopularMoviesUseCase>(),
      ),
    );
    return this;
  }
}
