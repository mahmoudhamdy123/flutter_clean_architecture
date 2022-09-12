


import 'package:clean_architecture/feature/weather/domain/entities/wheather.dart';
import 'package:clean_architecture/feature/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByCountryName{
  final BaseWeatherRepository repository;
  

  GetWeatherByCountryName(this.repository);

  Future<Weather> execute(String countryName)async{
    return await repository.getWeatherByCityName(countryName);
  }

}