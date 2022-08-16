import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCases(this.baseMoviesRepository);

  Future<List<Movie>> execute()async{
    return  await baseMoviesRepository.getTopRatedMovies();
  }
}