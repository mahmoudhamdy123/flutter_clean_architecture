



import 'package:clean_architecture/feature/weather/data/datasource/remote_datasource.dart';
import 'package:clean_architecture/feature/weather/domain/entities/wheather.dart';
import 'package:clean_architecture/feature/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository{

  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String countryName) async {
   return (await baseRemoteDataSource.getWeatherByCountryName(countryName))!;
  }

}