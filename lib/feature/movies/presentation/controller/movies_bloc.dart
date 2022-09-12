import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/usecase/base_useCase.dart';
import 'package:clean_architecture/core/utils/enums.dart';
import 'package:clean_architecture/feature/movies/domain/entities/movie.dart';
import 'package:clean_architecture/feature/movies/domain/usecases/get_new_playing_movies_usecases.dart';
import 'package:clean_architecture/feature/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:clean_architecture/feature/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final GetNewPlayingMoviesUseCases getNewPlayingMoviesUseCases;
  final GetPopularMoviesUseCases getPopularMoviesUseCases;
  final GetTopRatedMoviesUseCases getTopRatedMoviesUseCases;

  MoviesBloc(this.getNewPlayingMoviesUseCases,this.getTopRatedMoviesUseCases,this.getPopularMoviesUseCases) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNewPlayingMoviesUseCases(const NoParameters());
    result.fold((l) =>
        emit(state.copyWith(nowPlayingState: RequestState.error,nowPlayingMessage: l.message)),
            (r) =>
            emit(state.copyWith(nowPlayingState: RequestState.loaded,
                nowPlayingMovies: r)));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCases(const NoParameters());
    result.fold((l) =>
        emit(state.copyWith(popularState: RequestState.error,popularMessage: l.message)),
            (r) =>
            emit(state.copyWith(popularState: RequestState.loaded,
                popularMovies: r)));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCases(const NoParameters());
    result.fold((l) =>
        emit(state.copyWith(topRatedState: RequestState.error,topRatedMessage: l.message)),
            (r) =>
            emit(state.copyWith(topRatedState: RequestState.loaded,
                topRatedMovies: r)));
  }
}
