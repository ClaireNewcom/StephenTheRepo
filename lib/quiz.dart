//quiz
import 'dart:math';

class quiz {
    Random randy = new Random();
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

    WeatherConditions fakeWeather = new WeatherConditions(temp2, wind2, humid2, weather2);
    List<String>clothe = Clothes(fakeWeather);

    WeatherConditions ask(){
        return fakeWeather;
    }
    Boolean is(String cloth){
        if(clothe.contains(cloth)){
            return true;
        }else{}
            return false;
        }
    }

}
