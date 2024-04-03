import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class WeightedList {

  late String clothing;
  late int counter;

  WeightedList(){
    clothing = "";
    counter = 0;
  }

  WeightedList.givenclothesandcount(String str, int count){
    clothing = str;
    counter = count;
  }

  String getClothes() {
    return clothing;
  }

  void setClothes(String newClothing) {
    clothing = newClothing;
  }

  int getCounter() {
    return counter;
  }

  void setCounter(int i){
    counter = i;
  }

}