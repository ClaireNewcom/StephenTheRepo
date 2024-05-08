//clothes
//import 'dart:math';
import 'package:testingwindows/WeatherConditions.dart';

class Clothes {

  late double temp;
  //late double feelsLikeTemp;
  //late double windspeed;
 // late double humiditylevel;
  late String weatherType;

  Clothes(WeatherConditions weatherCondition) {
    temp = weatherCondition.getTempF();
    //windspeed = weatherCondition.getWind();
    //humiditylevel = weatherCondition.getHumid();
    weatherType = weatherCondition.getType();

   /* feelsLikeTemp = 35.74 + 0.6215 * temp - 35.75 * pow(windspeed, 0.16) +
        0.4275 * temp * pow(windspeed, 0.16);
    if (feelsLikeTemp > temp) {
      feelsLikeTemp = temp;
    }*/
  }

  Clothes.forQuiz(double temperature, String condition) {
    temp = temperature;
    //feelsLikeTemp = temperature;
    //windspeed = speed;
    //humiditylevel = humid;
    weatherType = condition;
  }

  Future<List<String>> clothingChoice() async {
    List<String> clothing = [];

    if (temp > 90) {
      //print("Warning: it is too hot to stay outside for very long. We recommend staying inside with an air conditioner or fan.");
      clothing.add('shorts');
      clothing.add('t-shirt');
      clothing.add('socks');
      clothing.add('sneakers or closed toed shoes');

      if (weatherType.compareTo('hail') == 0) {
        clothing.add('windbreaker coat');
      }
      else if (weatherType.compareTo('rainy') == 0) {
        clothing.add('raincoat');
        clothing.add('umbrella');
      }
      else {
        clothing.add('sunscreen');
      }
    }

    else if (temp < 10) {
      //print("Warning: it is too cold to stay outside for very long. We recommend staying inside with a heater and wearing many layers.");
      clothing.add("pants");
      clothing.add("long sleeved shirt");
      clothing.add("sweatshirt/sweater");
      clothing.add("thick socks");
      clothing.add("winter coat with hood");
      clothing.add("winter boots");
      clothing.add("hat");
      clothing.add("scarf");
      clothing.add("mittens");
    }

    else if (temp < 30) {
      clothing.add("pants");
      clothing.add("long sleeved shirt");
      clothing.add("sweatshirt/sweater");
      clothing.add("thick socks");
      clothing.add("winter coat with hood");
      clothing.add("winter boots");
      clothing.add("hat");
      clothing.add("scarf");
      clothing.add("mittens");
    }

    else if (temp < 40) {
      clothing.add("pants");
      clothing.add("t-shirt");
      clothing.add("socks");
      clothing.add("sweatshirt/sweater");
      clothing.add("sneakers or closed toed shoes");

      if (weatherType.compareTo("windy") == 0 ||
          weatherType.compareTo("hail") == 0) {
        clothing.add("winter coat with hood");
      }

      else {
        clothing.add("light coat");
      }
    }

    else if (temp < 60 /*because 50 and 60 are similar*/) {
      clothing.add("pants");
      clothing.add("t-shirt");
      clothing.add("socks");
      clothing.add("sweatshirt/sweater");
      clothing.add("sneakers or closed toed shoes");

      if (weatherType.compareTo("windy") == 0 ||
          weatherType.compareTo("hail") == 0) {
        clothing.add("windbreaker coat");
      }
      else if (weatherType.compareTo("rainy") == 0) {
        clothing.add("raincoat");
        clothing.add("umbrella");
      }
      else {
        clothing.add("light coat");
      }
    }

    else if (temp < 70) {
      clothing.add("shorts");
      clothing.add("t-shirt");
      clothing.add("socks");
      clothing.add("sneakers or closed toed shoes");

      if (weatherType.contains("hail")) {
        clothing.add("windbreaker coat");
      }
      else if (weatherType.compareTo("windy") == 0) {
        clothing.add("sweatshirt/sweater");
        clothing.add("sunscreen");
      }

      else if (weatherType.compareTo("rainy") == 0) {
        clothing.add("raincoat");
        clothing.add("umbrella");
      }
      else {
        clothing.add("sunscreen");
      }
    }

    else if (temp < 90) {
      clothing.add("shorts");
      clothing.add("t-shirt");
      clothing.add("socks");
      clothing.add("sandals");

      if (weatherType.compareTo("hail") == 0) {
        clothing.add("windbreaker coat");
        clothing.add("sneakers or closed toed shoes");
      }
      else if (weatherType.compareTo("rainy") == 0) {
        clothing.add("raincoat");
        clothing.add("umbrella");
      }
      else {
        clothing.add("sunscreen");
      }
    }
    return clothing;
  }
}