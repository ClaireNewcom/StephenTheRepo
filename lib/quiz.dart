//quiz
import 'dart:math';

class quiz {

  late double temp;
  late double feelsLikeTemp;
  late double windspeed;
  late double humiditylevel;
  late String weatherType;

  Clothes(double temperature, double wind, double humid, String weather) {
    temp = temperature;
    windspeed = wind;
    humiditylevel = humid;
    weatherType = weather;

    feelsLikeTemp = 35.74 + 0.6215 * temperature - 35.75 * pow(wind, 0.16) +
        0.4275 * temperature * pow(wind, 0.16);
    if (feelsLikeTemp > temp) {
      feelsLikeTemp = temp;
    }
  }

  clothingChoice() {
    List<String> clothing = [];

    if (feelsLikeTemp > 90) {
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

    else if (feelsLikeTemp < 10) {
      //print("Warning: it is too cold to stay outside for very long. We recommend staying inside with a heater and wearing many layers.");
      clothing.add("pants");
      clothing.add("long sleeved shirt");
      clothing.add("sweatshirt/sweater");
      clothing.add("thick socks");
      clothing.add("winter coat");
      clothing.add("winter boots");
      clothing.add("hat");
      clothing.add("scarf");
      clothing.add("gloves");
    }

    else if (feelsLikeTemp < 30) {
      clothing.add("pants");
      clothing.add("long sleeved shirt");
      clothing.add("sweatshirt/sweater");
      clothing.add("thick socks");
      clothing.add("winter coat");
      clothing.add("winter boots");
      clothing.add("hat");
      clothing.add("scarf");
      clothing.add("gloves");
    }

    else if (feelsLikeTemp < 40) {
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

    else if (feelsLikeTemp < 60 /*because 50 and 60 are similar*/) {
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

    else if (feelsLikeTemp < 70) {
      clothing.add("shorts");
      clothing.add("t-shirt");
      clothing.add("socks");
      clothing.add("sneakers or closed toed shoes");

      if (weatherType.compareTo("hail") == 0) {
        clothing.add("windbreaker coat");
      }
      else if (weatherType.compareTo("windy") == 0) {
        clothing.add("sweatshirt");
        clothing.add("Sunscreen");
      }

      else if (weatherType.compareTo("rainy") == 0) {
        clothing.add("raincoat");
        clothing.add("umbrella");
      }
      else {
        clothing.add("Sunscreen");
      }
    }

    else if (feelsLikeTemp < 90) {
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
  }
}
