

import 'dart:convert';

import 'package:clean_architecture/core/utils/constances.dart';
import 'package:clean_architecture/feature/weather/data/models/weather_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource{
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
}



class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async {
    try {
      var response = await Dio().get('${AppConstance.baseUrl}/weather?q=$countryName&appid=${AppConstance.appKey}');
      print(response);
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

}