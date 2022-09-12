

import 'package:clean_architecture/feature/weather/domain/entities/wheather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      super.id, super.cityName, super.main, super.description, super.pressure);


  factory WeatherModel.fromJson(Map<String,dynamic> json)=>
      WeatherModel(
        json["id"],
        json["name"],
        json["weather"][0]["main"],
        json["weather"][0]["description"],
        json["main"]["pressure"]
      );
}
