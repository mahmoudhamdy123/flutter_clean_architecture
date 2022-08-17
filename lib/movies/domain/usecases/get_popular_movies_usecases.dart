import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCases(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> execute()async{
    return  await baseMoviesRepository.getPopularMovies();
  }
}