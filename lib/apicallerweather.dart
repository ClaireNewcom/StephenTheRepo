
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather.dart';
import 'weatherFuture.dart';

/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied.
 */

///This class builds a link that can be used to call from the api Weather API (weatherapi.com).

class WeatherService {

  ///Returns a future instance of an object of the class WeatherNow of the file weather.dart. Takes in [cityName]
  ///as a String and builds the link to the api weather API (weatherapi.com) using a key and the name of the city.
  Future<WeatherNow> getCurrentWeatherData(String cityName) async {
    try {
      final queryParameters = {
        'key': '6b2ee4deca3e45e98fe123623241004',
        'q': cityName,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      //print(uri);
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

  ///Returns a future instance of an object of the class WeatherFuture of the file weatherFuture.dart. Takes in [cityName]
  ///as a String and [hourNum] as an int. If the hourNum is 0, 4, or 8, a link to the api
  ///weather API (weatherapi.com) is built using a key, the input city, the hour
  ///in the future that the weather will be found for in military time, and the day which is equal to 1.
  Future<WeatherFuture> getFutureWeatherData(String cityName, int hourNum) async {
    String hourReal = "";

    if (hourNum == 4 || hourNum == 8 || hourNum == 0) {
      var now = DateTime.now();
      int hour = now.hour;
      hourReal = (hour + hourNum).toString();

      try {
        final queryParameters = {
          'key': '6b2ee4deca3e45e98fe123623241004',
          'q': cityName,
          'days': '1',
          'hour': hourReal,
        };
        final uri = Uri.http(
            'api.weatherapi.com', '/v1/forecast.json', queryParameters);
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          return WeatherFuture.fromJson(jsonDecode(response.body));
        } else {
          throw Exception("Can not get weather");
        }
      } catch (e) {
        rethrow;
      }
    } //end if statement
    else {
      throw Exception("Can not get weather");
    }
  }
}
