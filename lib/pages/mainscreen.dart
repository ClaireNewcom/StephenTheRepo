import 'package:flutter/material.dart';
import '../apicallerweather.dart';
import '../weather.dart';


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

///This class represents the main screen page of the app WeatherWear.
///The class calls from the classes apicallerweather.dart and weather.dart
///to get the current weather conditions. It also provides an adaptive image
///method which allows the page to display different weather condition images
///based on the current weather and also different temperature images based
///on the current temperature. The main screen currently only shows temperature
///and weather conditions for Worcester MA. The button on the lower right side
///of the screen leads to the page described by wearUI.dart.

class _MainScreenState extends State<MainScreen> {
  //data
  WeatherService weatherService = WeatherService();
  WeatherNow weather = const WeatherNow();

  String currentWeather = "";
  double tempF = 0;
  String loadImage = '';
  String tempImage = '';

  @override
  void initState() {
    super.initState();
    getWeather('Worcester');
  }

  ///Calls from the class WeatherService within the file apicallerweather.dart
  ///and gets the current weather data for the given city.
  ///Takes in [city], which is the city from which the current weather will be obtained as a String.
  void getWeather(String city) async {
    weather = await weatherService.getCurrentWeatherData(city);

    setState(() {
      currentWeather = weather.condition;
      tempF = weather.tempF;
    });
  }

  ///Returns the current temperature in degrees Farenheight as a double.
  double getTempF() {
    return (tempF);
  }

  ///Returns the current weather condition, for example sunny or light rain, as a String.
  String getCurrentWeather() {
    return (currentWeather);
  }

  ///Returns the image path that corresponds to the current weather condition as a String.
  String assignImage() {
    if (currentWeather == 'Sunny' || currentWeather == 'Clear') {
      loadImage = 'assets/icons/sun2.png';
    }
    else if (currentWeather == 'partly Cloudy' ||
        currentWeather.contains('fog') ||
        currentWeather.contains('Mist'))
    {
      loadImage = "assets/icons/partlyCloudy.png";
    }
    else if (currentWeather.contains('freezing') ||
        currentWeather.contains('sleet'))
    {
      loadImage = 'assets/icons/sleet.png';
    }
    else if (currentWeather.contains('thunder'))
    {
      loadImage = 'assets/icons/thunder.png';
    }
    else if (currentWeather.contains('rain') ||
        currentWeather.contains('drizzle'))
    {
      loadImage = 'assets/icons/rain.png';
    }
    else if (currentWeather.contains('pellets')) {
      // Check for sun condition
      loadImage = 'assets/icons/hail.png';
    }
    else if (currentWeather.contains('snow') ||
        currentWeather.contains('Blizzard'))
    {
      loadImage = 'assets/icons/snow.png';
    }
    else if (currentWeather.contains('Overcast') ||
        currentWeather.contains('Cloudy'))
    {
      loadImage = 'assets/icons/cloudy.png';
    }
    else {
      loadImage = 'assets/icons/windy.jpg';
    }
    return loadImage;
  }

  ///Returns the image path that corresponds to the current temperature as a String.
  ///If the temperature is greater than 60 degrees farenheight, a red thermometer will be returned, and
  ///if the temperature is less than or equal to 60 degrees farenheight, a blue thermometer will be returned.
  String assignTemp() {
    if (tempF > 60) {
      tempImage = "assets/icons/ThermometerHighTemp.png";
    } else {
      tempImage = "assets/icons/ThermometerLowTemp.png";
    }
    return tempImage;
  }

  ///Constructs the main screen User Interface. Takes in [context] and builds an
  ///interface that shows the current weather condition and the current temperature.
  ///It displays images corresponding to the current weather condition and current temperature.
  ///The user interface leads to the page built in the class wearUI from the file wearUI.dart.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Today Is...',
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Your existing weather display stack
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.grey,
                    ),
                    Positioned(
                      top: 20,
                      child: Text(
                        currentWeather,
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                    Positioned(
                      bottom: 20, // Adjust bottom position as needed
                      child: Text(
                        "${tempF.toString()} degrees F",
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Image.asset(
                      assignImage(),
                      height: 500,
                      width: 500,
                    ),

                  ],
                ),
              ],
            ),
          ),
          // Positioned button at the bottom
          Positioned(
            bottom: 10,
            right: 20, // Adjust left position as needed
            child: Container(
              alignment: Alignment.bottomRight,
              height: 200,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 20, fontFamily: 'TimesNewRoman'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/What Should I wear?');
                },
                child: const Text('What Should I Wear?'),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 300, // Adjust left position as needed
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              child: Image.asset(
                assignTemp(),
                width: 150,
                height: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
