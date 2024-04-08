//quiz
import 'dart:math';

class quiz {
  var random = Random();
  late double temp2;
  late double wind2;
  late double humid2;
  late double weatherNum;
  late String weather2;
  quiz(){
    temp2 = (random.nextInt(110)-10) as double;
    wind2 = (random.nextInt(80)) as double;
    humid2 = random.nextInt(100) as double;
    weatherNum = random.nextInt(4) as double;

    if (weatherNum == 0){
      weather2 = 'sunny';
    }
    else if(weatherNum==1){
      weather2 = 'cloudy';
    }
    else if(weatherNum==2){
      weather2 = 'hail';
    }
    else {
      weather2 = 'rainy';
    }
  }


 Clothes(temp2, wind2, humid2, weather2){

  }

}
