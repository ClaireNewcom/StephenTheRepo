import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class WeatherConditions {

  late int temp;
  late int wind;
  late int humi;
  late String type;

  WeatherConditions(int temp, int wind, int humi, String type){//make it so that this information can be pulled straight from the api in the day weather class.
    this.temp = temp;
    this.wind = wind;
    this.humi = humi;
    this.type = type;
  }
   WeatherConditions(){//make it so that this information can be pulled straight from the api in the day weather class.
    temp = 0;
    wind = 0;
    humi = 0;
    type = '';
  }

  int getTemp() {
    return temp;
  }

  int getWind() {
    return wind;
  }

  int getHumid() {
    return humi;
  }

  String getType() {
    return type;
  }
  void setTemp(int tem) {
    temp = tem;
  }

  void setWind(it win) {
    wind = win;
  }

  void setHumid(int hum) {
    humi = hum;
  }

  void setType(String typ) {
    type = typ;
  }

  void clear(){
    temp = 0;
    wind = 0;
    humi = 0;
    type = '';
  }
}