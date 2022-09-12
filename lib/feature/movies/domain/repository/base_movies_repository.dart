

import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/feature/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
}