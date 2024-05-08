
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather.dart';
import 'weatherFuture.dart';

/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied.
 */
//May be able to get rid of this first method and have everything be in the second
//method
class WeatherService {
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

  Future<WeatherFuture> getFutureWeatherData(String cityName, int hourNum) async {
    String hourReal = "";
    /*this if statement might not be needed, if so delete the if statement, the
    brackets, and the else statement at the end. The stuff inside will be needed
    to get the future weather for the next few hours. If the user opens the app
    with less than 8 hours in the day, or less than 4 hours in a day,then it
    will only return the weather for the 4th hour or the current. Meaning, if
    there are 6 hours left in a day, then the algorithm will count the weather
    from the 4th hour twice and ignore the 8th hour prediction.
     */
    if (hourNum == 4 || hourNum == 8 || hourNum == 0) {
      var now = DateTime.now();
      int hour = now.hour;
      hourReal = (hour + hourNum).toString(); //not done

      try {
        final queryParameters = {
          'key': '6b2ee4deca3e45e98fe123623241004',
          'q': cityName,
          'days': '1',
          'hour': hourReal,
        };
        final uri = Uri.http(
            'api.weatherapi.com', '/v1/forecast.json', queryParameters);
       //print("hi! ");
       //print(uri); //link works
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
