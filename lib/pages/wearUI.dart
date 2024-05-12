
import 'package:flutter/material.dart';
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

///This class represents the page that shows what to wear of the app WeatherWear.
///The class calls from the classes in the files apicallerweather.dart, weather.dart, and weatherFuture.dart
///to get the current weather conditions and future weather conditions. It also provides an adaptive image
///method which allows the page to display different clothing images based on the
///clothing types calculated for the current and future weather types and temperatures. The main screen currently only shows temperature
///and weather conditions for Worcester MA. The button on the lower right side
///of the screen leads to the page described by wearUI.dart.
class _wearUIState extends State<wearUI> {

  WeatherService weatherService = WeatherService();
  WeatherNow weathernow = const WeatherNow();
  WeatherFuture weatherfuture = const WeatherFuture();
  WeatherFuture weatherfuture2 = const WeatherFuture();



  String currentWeather = "";
  double currentTempF = 0;

  String city = "Worcester";
  List<WeatherConditions> conditionsForClothes = [];
  List<String> theStringOfChosenOnes = [];
  int listChosenLength = 0;
  late final ScrollController _scrollController;

  bool isScrolling = false;

  ///Initializes the class, and calls getWeather.
  @override
  void initState() {
    super.initState();
    getWeather(city);
    _scrollController = ScrollController();

  }

  ///Calls from the class WeatherService within the file apicallerweather.dart
  ///and gets the current weather data for the given city, and also gets the future weather based on the current time.
  ///Takes in [city], which is the city from which the current weather will be obtained as a String.
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

  ///Takes in a List<WeatherConditions> [condition] and adds different clothing items to theStringOfChosenOnes.
  void gettingClothes(List<WeatherConditions> condition) async {
    WWTW theChosenOnes = WWTW();
    List<String> clothesList = await theChosenOnes.whatToWear(condition);

    setState(() {
      theStringOfChosenOnes = clothesList;
      listChosenLength = theStringOfChosenOnes.length;
    });

  }

  ///Returns the image path that corresponds to the [input]. If the input does not
  ///have a corresponding image path, an empty String will be returned.
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
      default: {
        link = "";
      }
    }
    return link;
  }
  /*
  Implementation for _buildList was learned and modified from
  https://www.woolha.com/tutorials/flutter-customscrollview-with-slivers-examples
   */
  ///Builds and returns a List<Widget> based on the List<String> [input]. These widgets can be displayed to the user in a list pattern.
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

  ///Constructs the what to wear screen User Interface. Takes in [context] and builds an
  ///interface that shows the different clothing items the user should wear based on
  ///the current weather and temperature, and the future weather and temperature of the day.
  ///It displays images corresponding to the clothing items the user should wear.
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
