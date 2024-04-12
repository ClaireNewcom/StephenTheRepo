
/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied, but modified it to our needs.
 */

class WeatherFuture{
  final double tempF;
  final String condition;
  final double windSpeed;

  const WeatherFuture ({
    this.tempF = 0,
    this.condition = '',
    this.windSpeed = 0,
    //can add more
  });

  factory WeatherFuture.fromJson(Map<String, dynamic> json){
    return WeatherFuture(
        tempF: json['forecast']['forecastday']['hour'][0]['temp_f'],
        condition: json['forecast']['forecastday']['hour'][0]['condition'][0]['text'],
        windSpeed: json['current']['wind_mph']);
  } //we will need to modify for different hours I think, figure out how to do that

  Future<double> getTemp() async {
    return tempF;
  }

  Future<String> getCondition() async {
    return condition;
  }

}