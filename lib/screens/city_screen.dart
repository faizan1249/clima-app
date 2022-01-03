import 'package:flutter/material.dart';
import 'package:clima_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {


  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  FocusNode focusNode = FocusNode();
  String hintText = "Please Enter City Name";
  String city_name="";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/city_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: null,
                ),
                Container(
                    width: 370.0,
                    child:TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0
                      ),
                      decoration: kInputDecoration,
                      onChanged: (value){
                        city_name = value;
                        // print(value);
                      },
                    )
                ),
                FlatButton(
                  onPressed: () {
                    print(city_name);
                    Navigator.pop(context,city_name);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
                SizedBox(height: 5.0,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
