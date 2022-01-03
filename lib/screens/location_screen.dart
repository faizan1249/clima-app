import 'package:flutter/material.dart';
import 'package:clima_app/utilities/constants.dart';
import 'package:clima_app/services/networking.dart';
import 'package:clima_app/services/weather.dart';
import 'package:clima_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/screens/city_screen.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({required this.weatherLocationData});
  final weatherLocationData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel model = WeatherModel();
  var temperatureInCel=0;
  int condition=0;
  String cityName="";
  String weatherIcon="";
  String weatherDesc="";

@override
  void initState() {
    super.initState();
    gettingJSONData(widget.weatherLocationData);
  }
  void gettingJSONData(dynamic weatherData)
  {
    setState(() {
      if(weatherData==null)
        {
          temperatureInCel = 0;
          cityName="";
          weatherIcon='Error';
          weatherDesc='';
          return;
        }
      temperatureInCel = weatherData['main']['temp'].round();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = model.getWeatherIcon(condition);
      weatherDesc = model.getMessage(temperatureInCel);
    });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async{
                        var weatherData = await model.getWeatherLocation();
                        gettingJSONData(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async{
                        var typedName = await Navigator.push(context,MaterialPageRoute(builder: (context) { return CityScreen();}));

                        // print(typedName);
                        if(typedName!=null)
                          {
                            WeatherModel model = WeatherModel();
                            var weatherData = await model.getCityWeather(typedName);
                            print(weatherData);
                            gettingJSONData(weatherData);
                          }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperatureInCel°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        "$weatherIcon",
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "$weatherDesc in $cityName",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//

