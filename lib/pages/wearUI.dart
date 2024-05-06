import 'dart:html';

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
  String futureWeather1 = "";
  double futureTemp1 = 0;
  String futureWeather2 = "";
  double futureTemp2 = 0;
  String city = "Worcester"; //will have to get the city from the user and will store that as a const variable or smth
  List<WeatherConditions> conditionsForClothes = [];
  List<String> theStringOfChosenOnes = [];
  int listChosenLength = 0;
  late final ScrollController _scrollController;

  bool isScrolling = false;

  //learned and modified from https://api.flutter.dev/flutter/widgets/ScrollController-class.html#:~:text=ScrollController%20class%20Controls%20a%20scrollable%20widget.%20Scroll%20controllers,State%20objects%20and%20are%20reused%20in%20each%20State.build.
  /*void _handleScrollChange() {
    if (isScrolling != _scrollController.position.isScrollingNotifier.value) {
      setState(() {
        isScrolling = _scrollController.position.isScrollingNotifier.value;
      });
    }
  }

  //learned and modified from https://api.flutter.dev/flutter/widgets/ScrollController-class.html#:~:text=ScrollController%20class%20Controls%20a%20scrollable%20widget.%20Scroll%20controllers,State%20objects%20and%20are%20reused%20in%20each%20State.build.
  void _handlePositionAttach(ScrollPosition position) {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          moveListUpBy1();
        });
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          moveListDownBy1();
        });
      }
    });
  }

  //learned and modified from https://api.flutter.dev/flutter/widgets/ScrollController-class.html#:~:text=ScrollController%20class%20Controls%20a%20scrollable%20widget.%20Scroll%20controllers,State%20objects%20and%20are%20reused%20in%20each%20State.build.
  /*void _handlePositionDetach(ScrollPosition position) {
    // From here, add a listener to the given ScrollPosition.
    // Here the isScrollingNotifier will be used to inform when scrolling starts
    // and stops and change the AppBar's color in response.
    position.isScrollingNotifier.removeListener(_handleScrollChange);
  }*/*/


  @override
  void initState() {
    super.initState();
    getWeather(city);
    _scrollController = ScrollController();

  }



  /*void moveListUpBy1() {
    final double itemHeight = window.innerHeight as double; // Calculate the height of one list item
    final double newPosition = _scrollController.offset - itemHeight;
    //_scrollController.jumpTo(newPosition);
    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.jumpTo(newPosition);
    });
  }

  void moveListDownBy1() {
    final double itemHeight = window.innerHeight as double; // Calculate the height of one list item
    final double newPosition = _scrollController.offset + itemHeight;
    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.jumpTo(newPosition);
    });
  }*/

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
            height: window.innerHeight?.toDouble(),
            alignment: Alignment.center,
          //height: 100, width: 100,
          child: Column(
            children: [
              Image.asset(
              'assets/icons/FlipFlops.png',
              width: 20,
              height: 20,
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
