import 'weather.dart';
import 'apicallerweather.dart';

class WeatherConditions {

  late double tempF;
  //late double wind;
  //late double humi;
  late String type;
  //WeatherService weatherService = WeatherService();
  //WeatherNow weather = WeatherNow();


  //USE THIS CLASS WEATHER CONDITIONS TO STORE TEMP AND TYPE. WILL CALL THIS IN
  //THE USER INTERFACE AND THEN PASS THIS TO THE CLOTHING CLASS
  WeatherConditions(double tempIn, String typeIn){
    tempF = tempIn;
    //this.wind = 0;
    //this.humi = 0;
    type = typeIn;
  }

  /*void getWeather(String city) async {
    weather = await weatherService.getCurrentWeatherData(city);

      type = weather.condition;
      tempF = weather.tempF;
      wind = weather.windSpeed;

    print(weather.tempF);
    print(weather.condition);
    print(weather.windSpeed);
  }*/

  double getTempF(){
    return tempF;
  }

  String getType() {
    return type;
  }
  void setTemp(double tem) {
    tempF = tem;
  }

  void setType(String typ) {
    type = typ;
  }

  void clear(){
    tempF = 0;
    type = '';
  }
}