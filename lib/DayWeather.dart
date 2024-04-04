//this class makes an array list of weather conditions for the day that will lter be sorted through by the WWTW algorithm
import 'dart:math';

class Clothes {
    //this class reads from the api, find the different aspects of the weiather, puts the information into a WeatherConditions type, and puts them in a list

  WeatherConditions nowWeath = new WeatherConditions()
  ArrayList<WeatherConditions> WeatherList = new ArrayList<WeatherConditions>();
    for(int i = 0; i<3 ;i++){ //the i's are for the different periods of the day
    // this part is wrong, will make seperate class tomorow for reading things
    int readTemp(){ 
       //reads temp from the api, assign to t
    }
    int readWind(){
       //reads wind from api, assign to w
    }
    int readHumid(){
       //reads humidity from api, assign to h
    }
    int readType(){
       //reads weather type from api, assign to e
    }
    nowWeath.setTemp(t);//do for all 4
    WeatherList.add(nowWeath);
    nowWeath.clear();
    }
}
