
/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied, but modified it to our needs.
 */

class WeatherNow{
  final double tempF;
  final String condition;
  final double windSpeed;

  const WeatherNow ({
    this.tempF = 0,
    this.condition = '',
    this.windSpeed = 0,
    //can add more
  });

  factory WeatherNow.fromJson(Map<String, dynamic> json){
    return WeatherNow(
    tempF: json['current']['temp_f'],
    condition: json['current']['condition']['text'],
    windSpeed: json['current']['wind_mph']);
  }

  /*double getTempF(){
    return tempF;
  }

  String getCondition(){
    return condition;
  }

  double getWindSpeed(){
    return windSpeed;
  }*/


}