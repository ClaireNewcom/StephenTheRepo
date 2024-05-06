
/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied, but modified it to our needs.
 */

class WeatherFuture{
  final double tempF;
  final String condition;
 // final double windSpeed;
  //final double precipitation;

  const WeatherFuture ({
    this.tempF = 0,
    this.condition = '',
    //this.windSpeed = 0,
    //this.precipitation = 0,
    //can add more
  });

  factory WeatherFuture.fromJson(Map<String, dynamic> json){
    return WeatherFuture(
        tempF: json['forecast']['forecastday'][0]['hour'][0]['temp_f'],
        condition: json['forecast']['forecastday'][0]['hour'][0]['condition']['text']);
       // windSpeed: json['forecast']['forecastday']['hour']['wind_mph'],
       // precipitation: json['forecast']['forecastday']['hour']['precip_in']);
  } //we will need to modify for different hours I think, figure out how to do that

  /*Future<double> getTemp() async {
    return tempF;
  }

  Future<String> getCondition() async {
    return condition;
  }*/

}