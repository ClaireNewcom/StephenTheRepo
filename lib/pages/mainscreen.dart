import 'dart:core';
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

class _MainScreenState extends State<MainScreen> {
  WeatherService weatherService = WeatherService();
  WeatherNow weather = WeatherNow();


  String currentWeather = "";
  double tempF = 0;
  String loadImage ='';
  String tempImage='';


  @override
  void initState() {
    super.initState();
    getWeather('Worcester');
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

  double getTempF() {
    return (tempF);
  }

  String getCurrentWeather() {
    return (currentWeather);

  }

  String assignImage(){
   if (currentWeather == 'Sunny' ||
       currentWeather == 'Clear')
    {
     loadImage = 'assets/icons/sun2.png';
  }
       else if (currentWeather == 'partly Cloudy' || currentWeather.contains('fog') || currentWeather.contains('Mist') ) // Check for sun condition
       {
     loadImage = "assets/icons/partlyCloudy.png";
   }

  else if (currentWeather.contains('freezing') || currentWeather.contains('sleet')) // Check for sun condition
       {
   loadImage = 'assets/icons/sleet.png';
   }

else if (currentWeather.contains('thunder')) // Check for sun condition
       {
   loadImage = 'assets/icons/thunder.png';

       }
else if (currentWeather.contains('rain') || currentWeather.contains('drizzle')) // Check for sun condition
        {
    loadImage = 'assets/icons/rain.png';
    }
  else if (currentWeather.contains('pellets'))
    {// Check for sun condition
    loadImage = 'assets/icons/hail.png';
    }

else if (currentWeather.contains('snow') || currentWeather.contains('Blizzard')) // Check for sun condition
        {
    loadImage = 'assets/icons/snow.png';
    }
else {
  loadImage='assets/icons/windy.jpg';
   }
return loadImage;

    }

    String assignTemp(){
     if (tempF>60){
       tempImage = "assets/icons/ThermometerHighTemp.png";
     }
     else {
       tempImage = "assets/icons/ThermometerLowTemp.png";
     }
     return tempImage;
    }



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
      body:
      Stack(
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
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Positioned(
                      bottom: 20, // Adjust bottom position as needed
                      child: Text(
                        tempF.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                      Image.asset(
                        assignImage(),
                        height: 500,
                        width: 500,
                      ),

                     /* else if (currentWeather == 'Cloudy' || currentWeather == 'Overcast') // Check for sun condition
                        Image.asset(
                            "assets/icons/cloud.png",
                            height: 500,
                            width: 500,
                       ),

                      */

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
              height: 100,
              width: 100,
              child: IconButton(
                icon: Image.asset(
                  'assets/icons/windy.jpg',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
    Navigator.pushNamed(
    context,
    '/What Should I wear?',
    );

    /*
    Positioned(
    top: 10,
    right: 20,
    child: Container(
    alignment: Alignment.topRight,
    height: 100,
    width: 100,
    child: IconButton(
    icon: Image.asset(
    'assets/icons/home2.jpg',
    width: 20,
    height: 20,
    ),
    onPressed: () {
    Navigator.pushNamed(
    context,
    '/Home',
    );
*/

    Positioned(
        top: 10,
        right: 20, // Adjust left position as needed
        child: Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          child: Image.asset(
            "assets/icons/ThermometerHighTemp.png",
            width: 20,
            height: 20,
          ),

        )
    );



    },
    )
    )
          )
    ]
    )
    );
  }

}





