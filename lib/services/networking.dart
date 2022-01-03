import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima_app/services/location.dart';


class NetworkHelper {
  NetworkHelper({
    required this.url,
  });

  final String url;
  double longitude = 0;
  double lattitude = 0;


  Future getWeatherData() async
  {
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));
      print(response);

      if (response.statusCode == 404)
        print(response.statusCode);
      else if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);

        return decodedData;
      }

    }
    catch (e) {
      print(e);
    }
  }
}

