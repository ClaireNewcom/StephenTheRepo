//quiz
import 'dart:math';

class quiz {
double temp2 = Random.nextInt(110)-10;
double wind2 = Random.nextInt(80);
double humid2 = Random.nextInt(100);
double weatherNum = Random.nextInt(4);
if(weatherNum==0){
String weather2 = 'sunny';
}else if(weatherNum==1){
String weather2 = 'cloudy';
}else if(weatherNum==2){
String weather2 = 'hail';
}else{
String weather2 = 'rainy';
}
 Clothes(temp2, wind2, humid2, weather2);
    
}
