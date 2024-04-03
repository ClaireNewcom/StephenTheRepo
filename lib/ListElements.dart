import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ListElements {

  late String clothing;
  late int counter;

  ListElements(){
    clothing = "";
    counter = 0;
  }

  ListElements.addElement(String str, int count){
    clothing = str;
    counter = count;
  }
 
  ListElements.addElement(){
    clothing = "";
    counter = 0;
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

  void incrementCounter(){
    counter++;
  }

}