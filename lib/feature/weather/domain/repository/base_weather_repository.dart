



import 'package:clean_architecture/feature/weather/domain/entities/wheather.dart';

abstract class BaseWeatherRepository{
  Future<Weather> getWeatherByCityName(String cityName);
  
}