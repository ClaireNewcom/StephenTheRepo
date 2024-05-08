import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testingwindows/weather.dart';
import 'package:testingwindows/apicallerweather.dart';

/*
  class _HomePage extends State<HomePage> {
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
        appBar: AppBar(
            title: const Text(
                'Today Is...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
            //leading: Container(
            // margin: EdgeInsets.all(10),
            //alignment: Alignment.center,
            // decoration: const BoxDecoration(
            //  color: Color(0xffFFFFFF)
            //  ),
          actions: <Widget>[
            Container(
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(
                  height: 100,
                  width: 100,
                ),
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/home2.jpg',
                    width: 20,
                    height: 20,
                  ),
                    onPressed: () {
                    Navigator.pushNamed(
                      context, '/second'
                      /*CupertinoPageRoute(builder: (context)
                      const wearUI()),*/
                    );
                  },
                ),
              ),
            ),
          ],
        ),


        body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Text(currentWeather),
         // Text(tempF.toString()),
          Image.asset(
            'assets/icons/home2.jpg',
            width: 20,
            height: 20,
          )
        ]

    )));
  }





}
*/

