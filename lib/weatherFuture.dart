
/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied, but modified it to our needs.
 */

///This class calls from the Json file from the api weather API (weatherapi.com).
class WeatherFuture{
  final double tempF;
  final String condition;

  ///Constructs an instance of the WeatherFuture class with an initial value of tempF = 0, and an initial condition of an empty string.
  const WeatherFuture ({
    this.tempF = 0,
    this.condition = '',

  });

  ///Calls from the Json file from the api weather API (weatherapi.com), and sets tempF
  /// and condition to the corresponding values in the api. Takes in a map of String [json] which is used to
  /// call from the api.
  factory WeatherFuture.fromJson(Map<String, dynamic> json){
    return WeatherFuture(
        tempF: json['forecast']['forecastday'][0]['hour'][0]['temp_f'],
        condition: json['forecast']['forecastday'][0]['hour'][0]['condition']['text']);

  }

}