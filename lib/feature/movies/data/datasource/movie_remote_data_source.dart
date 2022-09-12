

import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/network/api_constanse.dart';
import 'package:clean_architecture/core/network/error_message_model.dart';
import 'package:clean_architecture/feature/movies/data/models/movies_model.dart';

import 'package:dio/dio.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final Response response =await Dio()
        .get(ApiConstance.nowPlayingMoviesPath);
    if(response.statusCode ==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final Response response =await Dio()
        .get(ApiConstance.popularMoviesPath);
    if(response.statusCode ==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final Response response =await Dio()
        .get(ApiConstance.topRatedMoviesPath);
    if(response.statusCode ==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}