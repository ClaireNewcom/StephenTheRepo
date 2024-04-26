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
          children: [
            Text(currentWeather),
            Text(tempF.toString()),
          ],
        ),
      ),
    );
  }
}