
///This class takes in a String representing an article of clothing, and increments a counter.
class WeightedList {

  late String clothing;
  late int counter;

  ///Constructs an instance of the WeightedList class where clothing is set equal to an empty string
  /// and counter is set equal to 0.
  WeightedList(){
    clothing = "";
    counter = 0;
  }

  ///Constructs an instance of the WeightedList class where clothing is set equal to a
  ///given String [str], and the counter is set equal to a given int [count].
  WeightedList.addElement(String str, int count){
    clothing = str;
    counter = count;
  }

  ///Gets and returns the value of clothing as a String.
  String getClothes() {
    return clothing;
  }

  ///Sets the value of clothing to the String [newClothing].
  void setClothes(String newClothing) {
    clothing = newClothing;
  }

  ///Gets and returns the value of counter as an int.
  int getCounter() {
    return counter;
  }

  ///Sets the value of counter to the int [i]
  void setCounter(int i){
    counter = i;
  }

  ///Increments the value of counter by 1.
  void incrementCounter(){
    counter++;
  }

}