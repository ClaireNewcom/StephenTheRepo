class WeightedList {

  late String clothing;
  late int counter;

  WeightedList(){
    clothing = "";
    counter = 0;
  }

  WeightedList.addElement(String str, int count){
    clothing = str;
    counter = count;
  }
 
  /*WeightedList.addElement(){
    clothing = "";
    counter = 0;
  }*/

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