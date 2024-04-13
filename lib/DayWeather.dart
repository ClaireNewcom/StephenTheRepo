//this class makes an array list of weather conditions for the day that will lter be sorted through by the WWTW algorithm
//This class is NOT done yet, modifications need to be made so it functions better
import 'WeatherConditions.dart';


class DayWeather {
  //this class reads from the api, find the different aspects of the weiather, puts the information into a WeatherConditions type, and puts them in a list
  int h = 0;
  WeatherConditions nowWeath = new WeatherConditions();
  List<WeatherConditions> weatherList = [];

  dayWeather(){
    //h = ReadApi.getTime();
    for(int i = 0; i<3 ;i++){ //the i's are for the different periods of the day
      /*nowWeath.setTemp(ReadApi.readTemp(4*i+h));//gets temperature based on hour + time away
      nowWeath.setWind(ReadApi.readWind(4*i+h));
      nowWeath.setHumid(ReadApi.readHumid(4*i+h));
      nowWeath.setType(ReadApi.readType(4*i+h));
      weatherList.add(nowWeath);
      nowWeath.clear();*/
    }
  }
  List<WeatherConditions> getDayWeather(){
    return weatherList;
  }
}