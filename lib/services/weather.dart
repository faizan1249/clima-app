import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:flutter/material.dart';
const weatherAPIkey = "9e486b96944d415db8c0f96f80885807";
const weatherURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {


  Future<dynamic> getCityWeather(String city_Name)async
  {
    NetworkHelper helper = NetworkHelper(url: ""
        "$weatherURL?q=$city_Name&appid=$weatherAPIkey&units=metric");
    var weatherData= await helper.getWeatherData();
    return weatherData;
  }


  Future<dynamic> getWeatherLocation ()async
  {
    double longitude = 0;
    double lattitude = 0;
    Location loc = Location();
    await loc.getCurrentLocation();
    longitude = loc.long;
    lattitude = loc.lat;

    NetworkHelper helper = NetworkHelper(
        url: "$weatherURL?"
            "lat=$lattitude&lon=$longitude&appid=$weatherAPIkey&units=metric");

    var weatherData = await helper.getWeatherData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
