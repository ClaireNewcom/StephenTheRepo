import 'weather.dart';
import 'apicallerweather.dart';

class WeatherConditions {

  late double tempF;
  late double wind;
  late double humi;
  late String type;
  WeatherService weatherService = WeatherService();
  WeatherNow weather = WeatherNow();

  WeatherConditions(){
    this.tempF = 60;
    this.wind = 0;
    this.humi = 0;
    this.type = 'Sunny';
  }

  void getWeather(String city) async {
    weather = await weatherService.getCurrentWeatherData(city);

      type = weather.condition;
      tempF = weather.tempF;
      wind = weather.windSpeed;

    print(weather.tempF);
    print(weather.condition);
    print(weather.windSpeed);
  }

  double getTempF(){
    return tempF;
  }

  double getWind() {
    return wind;
  }

  double getHumid() {
    return humi;
  }

  String getType() {
    return type;
  }
  void setTemp(double tem) {
    tempF = tem;
  }

  void setWind(double win) {
    wind = win;
  }

  void setHumid(double hum) {
    humi = hum;
  }

  void setType(String typ) {
    type = typ;
  }

  void clear(){
    tempF = 0;
    wind = 0;
    humi = 0;
    type = '';
  }
}