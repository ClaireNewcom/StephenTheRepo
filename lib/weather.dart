
/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied, but modified it to our needs.
 */

///This class calls from the Json file from the api weather API (weatherapi.com).
class WeatherNow{
  final double tempF;
  final String condition;

  ///Constructs an instance of the WeatherNow class with an initial value of tempF = 0, and an initial condition of an empty string.
  const WeatherNow ({
    this.tempF = 0,
    this.condition = '',
  });

  ///Calls from the Json file from the api weather API (weatherapi.com), and sets tempF
  /// and condition to the corresponding values in the api. Takes in a map of String [json] which is used to
  /// call from the api.
  factory WeatherNow.fromJson(Map<String, dynamic> json){
    return WeatherNow(
    tempF: json['current']['temp_f'],
    condition: json['current']['condition']['text']);
  }

}