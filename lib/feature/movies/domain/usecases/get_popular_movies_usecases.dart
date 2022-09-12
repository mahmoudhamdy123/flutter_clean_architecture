import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecase/base_useCase.dart';
import 'package:clean_architecture/feature/movies/domain/entities/movie.dart';
import 'package:clean_architecture/feature/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCases extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters)async{
    return  await baseMoviesRepository.getPopularMovies();
  }
}