
import 'package:clean_architecture/feature/movies/data/repository/movies_repository.dart';
import 'package:clean_architecture/feature/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_architecture/feature/movies/domain/usecases/get_new_playing_movies_usecases.dart';
import 'package:clean_architecture/feature/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:clean_architecture/feature/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:clean_architecture/feature/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../feature/movies/data/datasource/movie_remote_data_source.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    ///Use cases
    sl.registerLazySingleton(() => GetNewPlayingMoviesUseCases(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCases(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCases(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}