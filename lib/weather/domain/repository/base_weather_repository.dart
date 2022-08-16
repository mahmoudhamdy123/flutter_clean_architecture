


import 'package:clean_architecture/weather/domain/entities/wheather.dart';

abstract class BaseWeatherRepository{
  Future<Weather> getWeatherByCityName(String cityName);
}