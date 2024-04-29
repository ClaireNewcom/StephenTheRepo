//quiz
//This class is unfinished
import 'dart:math';
import 'clothes.dart';


class Quiz {
  //WeatherConditions fakeWeather = new WeatherConditions();
  List<String>clothe = [];

  quiz(){
    Random randy = Random();
    double temp2 = (randy.nextInt(110)-10).toDouble();
    double wind2 = (randy.nextInt(80)).toDouble();
    double humid2 = (randy.nextInt(100)).toDouble();
    int weatherNum = randy.nextInt(4);
    String weather2 = '';

    if(weatherNum==0){
      weather2 = 'sunny';
    }else if(weatherNum==1){
      weather2 = 'cloudy';
    }else if(weatherNum==2){
      weather2 = 'hail';
    }else{
      weather2 = 'rainy';
    }
    Clothes fakeClothes = Clothes.forQuiz(temp2, wind2, humid2, weather2);
    //fakeWeather = [temp2, wind2, humid2, weather2];
    clothe = fakeClothes.clothingChoice();
  }

  /*WeatherConditions ask(){
    return fakeWeather;
  }*/

  List<String> fakeWhatToWear(){
    return clothe;
  }

  bool correct(String cloth){
    if(clothe.contains(cloth)){
      return true;
    }else{
      return false;
    }
  }
}