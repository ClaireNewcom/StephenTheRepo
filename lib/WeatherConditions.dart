
///This class stores the temperature in degrees farenheight as a double from the api,
///and the weather type as a string from the api.
class WeatherConditions {

  late double tempF;

  late String type;

  ///Constructs an instance of the WeatherConditions class using [tempIn], which
  ///is set equal to tempF, and using [typeIn], which is set equal to type.
  WeatherConditions(double tempIn, String typeIn){
    tempF = tempIn;
    type = typeIn;
  }


  ///Gets and returns the value of tempF as a double.
  double getTempF(){
    return tempF;
  }

  ///Gets and returns the value of type as a String.
  String getType() {
    return type;
  }

  ///Sets the value of tempF equal to [tem].
  void setTemp(double tem) {
    tempF = tem;
  }

  ///Sets the value of type equal to [typ].
  void setType(String typ) {
    type = typ;
  }

  ///Resets the value of tempF to 0, and the value of type to an empty String.
  void clear(){
    tempF = 0;
    type = '';
  }
}