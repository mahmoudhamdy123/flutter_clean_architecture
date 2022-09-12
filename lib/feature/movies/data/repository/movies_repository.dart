


import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/feature/movies/data/datasource/movie_remote_data_source.dart';
import 'package:clean_architecture/feature/movies/domain/entities/movie.dart';
import 'package:clean_architecture/feature/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';


class MoviesRepository extends BaseMoviesRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);


  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies()async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



}