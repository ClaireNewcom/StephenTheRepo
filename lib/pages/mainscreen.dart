import 'package:flutter/material.dart';
import '../apicallerweather.dart';
import '../WWTW.dart';
import '../weather.dart';
import 'package:testingwindows/WeatherConditions.dart';

/*
The code for this section was learned from the tutorial How to Get API with
Flutter! (Weather Api) made by Bytx on Youtube https://www.youtube.com/watch?v=c9XyI8zM73k.
We used the api mentioned in the tutorial, and we used the code they supplied.
 */

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherService weatherService = WeatherService();
  WeatherNow weather = WeatherNow();


  String currentWeather = "";
  double tempF = 0;

  @override
  void initState() {
    super.initState();
    getWeather('Boston');
  }

  void getWeather(String city) async {
    weather = await weatherService.getCurrentWeatherData(city);

    setState(() {
      currentWeather = weather.condition;
      tempF = weather.tempF;
    });
    print(weather.tempF);
    print(weather.condition);
  }

  double getTempF(){
    return(tempF);
  }

  String getCurrentWeather(){
    return(currentWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentWeather),
            Text(tempF.toString()),
          ],
        ),
      ),
    );
  }
}