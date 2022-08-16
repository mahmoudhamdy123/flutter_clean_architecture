

import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/network/error_message_model.dart';
import 'package:clean_architecture/movies/data/models/movies_model.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final Response response =await Dio()
        .get("https://api.themoviedb.org/3/movie/now_playing?api_key=80b11863a99bb4ae5e1f143daff78589");
    if(response.statusCode ==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}