//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testingwindows/WWTW.dart';
import 'package:testingwindows/WeatherConditions.dart';
import "package:testingwindows/weatherFuture.dart";

import '../apicallerweather.dart';
import '../weather.dart';

class wearUI extends StatefulWidget {
  const wearUI({Key? key}) : super(key: key);

  @override
  State<wearUI> createState() => _wearUIState();
}

class _wearUIState extends State<wearUI> {

  WeatherService weatherService = WeatherService();
  WeatherNow weathernow = WeatherNow();
  WeatherFuture weatherfuture = WeatherFuture();
  WeatherFuture weatherfuture2 = WeatherFuture();



  String currentWeather = "";
  double currentTempF = 0;
  //String futureWeather1 = "";
  //double futureTemp1 = 0;
  //String futureWeather2 = "";
  //double futureTemp2 = 0;
  String city = "Worcester"; //will have to get the city from the user and will store that as a const variable or smth
  List<WeatherConditions> conditionsForClothes = [];
  List<String> theStringOfChosenOnes = [];
  int listChosenLength = 0;
  late final ScrollController _scrollController;

  bool isScrolling = false;

  @override
  void initState() {
    super.initState();
    getWeather(city);
    _scrollController = ScrollController();

  }


  void getWeather(String city) async {
    var now = DateTime.now();
    int hour = now.hour;

    weathernow = await weatherService.getCurrentWeatherData(city);
    WeatherConditions currentConditions = WeatherConditions(weathernow.tempF, weathernow.condition);
    if(hour + 4 >24){
      weatherfuture = await weatherService.getFutureWeatherData(city, 0);
      weatherfuture2 = await weatherService.getFutureWeatherData(city, 0);
    }
    else if(hour +8 > 24){
      weatherfuture = await weatherService.getFutureWeatherData(city, 4);
      weatherfuture2 = await weatherService.getFutureWeatherData(city, 4);
    }
    else{
      weatherfuture = await weatherService.getFutureWeatherData(city, 4);
      weatherfuture2 = await weatherService.getFutureWeatherData(city, 8);
    }

    WeatherConditions futureConditions = WeatherConditions(weatherfuture.tempF, weatherfuture.condition);
    WeatherConditions futureConditions2 = WeatherConditions(weatherfuture2.tempF, weatherfuture2.condition);

    setState(() {
      currentWeather = weathernow.condition;
      currentTempF = weathernow.tempF;
      conditionsForClothes.add(currentConditions);
      conditionsForClothes.add(futureConditions);
      conditionsForClothes.add(futureConditions2);
      gettingClothes(conditionsForClothes);
    });
  }

  void gettingClothes(List<WeatherConditions> condition) async {
    WWTW theChosenOnes = WWTW();
    print("hello");
    print(condition[0].getTempF());
    //print(condition.length);
    List<String> clothesList = await theChosenOnes.whatToWear(condition);

    setState(() {
      theStringOfChosenOnes = clothesList; // Update the list inside setState
      listChosenLength = theStringOfChosenOnes.length;
    });
    print('debug');
      print(theStringOfChosenOnes.length);
      print("debug2");
    for (int i = 0; i < theStringOfChosenOnes.length; i++) {
      print("forloop");
      print(theStringOfChosenOnes[i]);
    }
  }

  String _imgLink (String input){
    String link = "";
    switch(input){
      case "shorts":{
        link = "assets/icons/shorts.png";}
        break;
      case "t-shirt": {
        link = "assets/icons/tShirt.png";
      } break;
      case "socks": {
        link = "assets/icons/Socks.png";
      } break;
      case "sneakers or closed toed shoes": {
        link = "assets/icons/Sneaker.png";
      } break;
      case "windbreaker coat": {
        link = "assets/icons/Windbreaker.png";
      } break;
      case "raincoat": {
        link = "assets/icons/RainJacket.png";
      } break;
      case "umbrella": {
        link = "assets/icons/Umbrella.png";
      } break;
      case "sunscreen": {
        link = "assets/icons/Sunscreen.png";
      } break;
      case "pants": {
        link = "assets/icons/pants2.png";
      } break;
      case "long sleeved shirt": {
        link = "assets/icons/Longsleeve.png";
      } break;
      case "sweatshirt/sweater": {
        link = "assets/icons/Sweater.png";
      } break;
      case "thick socks": {
        link = "assets/icons/ThickSocks.png";
      } break;
      case "winter coat with hood": {
        link = "assets/icons/Puffer.png";
      } break;
      case "winter boots": {
        link = "assets/icons/SnowBoots.png";
      } break;
      case "hat": {
        link = "assets/icons/WinterHat.png";
      } break;
      case "scarf": {
        link = "assets/icons/Scarf.png";
      } break;
      case "mittens": {
        link = "assets/icons/Mitten.png";
      } break;
      case "light coat": {
        link = "assets/icons/Sweatshirt.png";
      } break;
      case "sandals": {
        link = "assets/icons/Sandals.png";
      } break;
    }
    return link;
  }
  /*
  Implementation for _buildList was learned and modified from
  https://www.woolha.com/tutorials/flutter-customscrollview-with-slivers-examples
   */
  List<Widget> _buildList(List<String> input){
    List<Widget> listItems = [];

    for(int f = 0; f < input.length; f++){
      listItems.add(Padding(padding: const EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0, bottom: 20.0),
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
          //height: 100, width: 100,
          child: Column(
            children: [
              Image.asset(
              _imgLink(input[f]),
              width: 500,
              //height: 500,
            ),

              Text(
                  input[f],
                  style: const TextStyle(fontSize: 25.0)
              ),]
          )

        )),);
    }
   // childCount: listItems.length;
    return listItems;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'What Should I Wear?',
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

      ),

      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You Should Wear:",
              style: TextStyle(
            color: Colors.purple,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          )),
              //Text(currentTempF.toString()),
              Expanded(  // Wrap ListView with Expanded
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return _buildList(theStringOfChosenOnes)[index];
                        },
                        childCount: listChosenLength,
                      ),
                    ),
                  ],

                )

              ),
            ],
          ),

        ),
      );
  }
}
