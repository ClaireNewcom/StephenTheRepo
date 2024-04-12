
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather.dart';
import 'weatherFuture.dart';

/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied.
 */

class WeatherService {
  Future<WeatherNow> getCurrentWeatherData(String cityName) async {
    try {
      final queryParameters = {
        'key': '6b2ee4deca3e45e98fe123623241004',
        'q': cityName,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      print(uri);
      final response = await http.get(uri);
      if(response.statusCode == 200) {
        return WeatherNow.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch(e) {
      rethrow;
    }
  }

  Future<WeatherFuture> getFutureWeatherData(String cityName, String hourNum) async {
    try {
      final queryParameters = {
        'key': '6b2ee4deca3e45e98fe123623241004',
        'q': cityName,
        'days': '1',
        'hour': hourNum,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/forecast.json', queryParameters);
      final response = await http.get(uri);
      if(response.statusCode == 200) {
        return WeatherFuture.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch(e) {
      rethrow;
    }
  }


}
