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
import '../core/utils/firebase_utils.dart' as _i125;
import '../data/data_source/remote_data_source_impl/discover_remote_data_source_impl.dart'
    as _i356;
import '../data/data_source/remote_data_source_impl/history_remote_data_source_impl.dart'
    as _i964;
import '../data/data_source/remote_data_source_impl/home_remote_data_source_impl.dart'
    as _i285;
import '../data/data_source/remote_data_source_impl/search_remote_data_source_impl.dart'
    as _i88;
import '../data/repository/discover_repository_impl.dart' as _i505;
import '../data/repository/history_repository_impl.dart' as _i175;
import '../data/repository/home_repository_impl.dart' as _i723;
import '../data/repository/search_repository_impl.dart' as _i261;
import '../domain/repositorty/data_sources/remote_data_source/discover_remote_data_source.dart'
    as _i874;
import '../domain/repositorty/data_sources/remote_data_source/history_remote_data_sorce.dart'
    as _i1033;
import '../domain/repositorty/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i810;
import '../domain/repositorty/data_sources/remote_data_source/search_remote_data_source.dart'
    as _i311;
import '../domain/repositorty/repositories/discover_repository.dart' as _i74;
import '../domain/repositorty/repositories/history_repository.dart' as _i289;
import '../domain/repositorty/repositories/home_repository.dart' as _i802;
import '../domain/repositorty/repositories/search_repository.dart' as _i675;
import '../domain/use_cases/add_movie_to_history_use_case.dart' as _i524;
import '../domain/use_cases/get_cast_of_movie_use_case.dart' as _i485;
import '../domain/use_cases/get_genre_list_use_case.dart' as _i867;
import '../domain/use_cases/get_movie_details_use_case.dart' as _i914;
import '../domain/use_cases/get_movies_history_use_case.dart' as _i792;
import '../domain/use_cases/get_popular_movies_use_case.dart' as _i385;
import '../domain/use_cases/get_screen_shots_use_case.dart' as _i361;
import '../domain/use_cases/get_search_movie_use_case.dart' as _i299;
import '../domain/use_cases/get_similar_movies_use_case.dart' as _i453;
import '../domain/use_cases/get_specific_movies_use_case.dart' as _i1067;
import '../feature/home/tabs/1-home_screen/cubit/home_screen_view_model.dart'
    as _i1001;
import '../feature/home/tabs/2-search_screen/cubit/search_view_model.dart'
    as _i568;
import '../feature/home/tabs/3-explore_screen/cubit/browse_screen_view_model.dart'
    as _i983;
import '../feature/home/tabs/4-profile_screen/cubit/profile_screen_view_model.dart'
    as _i660;
import '../feature/home/tabs/movie_details/cubit/movie_details_view_model.dart'
    as _i604;
import '../feature/home/tabs/movie_details/cubit/similar_movie_view_model.dart'
    as _i679;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.singleton<_i125.FirebaseUtils>(() => _i125.FirebaseUtils());
    gh.factory<_i1033.HistoryRemoteDataSource>(
      () => _i964.HistoryRemoteDataSourceImpl(
        firebaseUtils: gh<_i125.FirebaseUtils>(),
      ),
    );
    gh.factory<_i311.SearchRemoteDataSource>(
      () => _i88.SearchRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()),
    );
    gh.factory<_i810.HomeRemoteDataSource>(
      () => _i285.HomeRemoteDataSourceImpl(apiManager: gh<_i108.ApiManager>()),
    );
    gh.factory<_i802.HomeRepository>(
      () => _i723.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i810.HomeRemoteDataSource>(),
      ),
    );
    gh.factory<_i874.DiscoverRemoteDataSource>(
      () => _i356.DiscoverRemoteDataSourceImpl(
        apiManager: gh<_i108.ApiManager>(),
      ),
    );
    gh.factory<_i289.HistoryRepository>(
      () => _i175.HistoryRepositoryImpl(
        historyRemoteDataSource: gh<_i1033.HistoryRemoteDataSource>(),
      ),
    );
    gh.factory<_i485.GetCastOfMovieUseCase>(
      () => _i485.GetCastOfMovieUseCase(
        homeRepository: gh<_i802.HomeRepository>(),
      ),
    );
    gh.factory<_i385.GetPopularMoviesUseCase>(
      () => _i385.GetPopularMoviesUseCase(
        homeRepository: gh<_i802.HomeRepository>(),
      ),
    );
    gh.factory<_i361.GetScreenShotsUseCase>(
      () => _i361.GetScreenShotsUseCase(
        homeRepository: gh<_i802.HomeRepository>(),
      ),
    );
    gh.factory<_i453.GetSimilarMoviesUseCase>(
      () => _i453.GetSimilarMoviesUseCase(
        homeRepository: gh<_i802.HomeRepository>(),
      ),
    );
    gh.factory<_i1067.GetSpecificMoviesUseCase>(
      () => _i1067.GetSpecificMoviesUseCase(
        homeRepository: gh<_i802.HomeRepository>(),
      ),
    );
    gh.factory<_i675.SearchRepository>(
      () => _i261.SearchRepositoryImpl(
        searchRemoteDataSource: gh<_i311.SearchRemoteDataSource>(),
      ),
    );
    gh.factory<_i74.DiscoverRepository>(
      () => _i505.DiscoverRepositoryImpl(
        discoverRemoteDataSource: gh<_i874.DiscoverRemoteDataSource>(),
      ),
    );
    gh.factory<_i1001.HomeScreenViewModel>(
      () => _i1001.HomeScreenViewModel(
        getPopularMoviesUseCase: gh<_i385.GetPopularMoviesUseCase>(),
        getSpecificMoviesUseCase: gh<_i1067.GetSpecificMoviesUseCase>(),
      ),
    );
    gh.factory<_i299.GetSearchMovieUseCase>(
      () => _i299.GetSearchMovieUseCase(
        searchRepository: gh<_i675.SearchRepository>(),
      ),
    );
    gh.factory<_i524.AddMovieToHistoryUseCase>(
      () => _i524.AddMovieToHistoryUseCase(
        historyRepository: gh<_i289.HistoryRepository>(),
      ),
    );
    gh.factory<_i792.GetMoviesHistoryUseCase>(
      () => _i792.GetMoviesHistoryUseCase(
        historyRepository: gh<_i289.HistoryRepository>(),
      ),
    );
    gh.factory<_i679.SimilarMovieViewModel>(
      () => _i679.SimilarMovieViewModel(
        getSimilarMoviesUseCase: gh<_i453.GetSimilarMoviesUseCase>(),
      ),
    );
    gh.factory<_i867.GetGenreListUseCase>(
      () => _i867.GetGenreListUseCase(
        discoverRepository: gh<_i74.DiscoverRepository>(),
      ),
    );
    gh.factory<_i914.GetMovieDetailsUseCase>(
      () => _i914.GetMovieDetailsUseCase(
        discoverRepository: gh<_i74.DiscoverRepository>(),
      ),
    );
    gh.factory<_i660.ProfileViewModel>(
      () => _i660.ProfileViewModel(
        addMovieToHistoryUseCase: gh<_i524.AddMovieToHistoryUseCase>(),
        getMoviesHistoryUseCase: gh<_i792.GetMoviesHistoryUseCase>(),
      ),
    );
    gh.factory<_i983.BrowseScreenViewModel>(
      () => _i983.BrowseScreenViewModel(
        genreListUseCase: gh<_i867.GetGenreListUseCase>(),
        getSpecificMoviesUseCase: gh<_i1067.GetSpecificMoviesUseCase>(),
      ),
    );
    gh.factory<_i568.SearchViewModel>(
      () => _i568.SearchViewModel(
        getSearchMovieUseCase: gh<_i299.GetSearchMovieUseCase>(),
      ),
    );
    gh.factory<_i604.MovieDetailsViewModel>(
      () => _i604.MovieDetailsViewModel(
        getMovieDetailsUseCase: gh<_i914.GetMovieDetailsUseCase>(),
        getScreenShotsUseCase: gh<_i361.GetScreenShotsUseCase>(),
        getCastOfMovieUseCase: gh<_i485.GetCastOfMovieUseCase>(),
      ),
    );
    return this;
  }
}
