

import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';

class GetNewPlayingMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetNewPlayingMoviesUseCases(this.baseMoviesRepository);

  Future<List<Movie>> execute()async{
    return  await baseMoviesRepository.getNowPlaying();
  }
}