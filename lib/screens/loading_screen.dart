import 'package:clima_app/services/networking.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




Widget loadingspinner(){
  return SpinKitDoubleBounce(
      color: Colors.white,
      size: 100.0,
  );
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherModel model = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async
  {

    var weatherData = await model.getWeatherLocation();

    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
      return LocationScreen(weatherLocationData:weatherData);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loadingspinner(),
      ),
    );
  }
}


