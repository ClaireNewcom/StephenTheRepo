
class WWTW {

	List<WeightedList> WWTW = [];
  List<String> calculatedClothes = [];
	DayWeather.forEach(weatherCondition){
		Clothes c = new Clothes (weatherCondition);//make it so it works for the new class structure(it has weatehrCondition variable from the class WeatherConditions)
    calculatedClothes.add(c.clothingChoice);
  }
		
		calculatedClothes.forEach(j){
			if(WWTW.contains(j)) {	
        WWTW.get(WWTW.indexof(j).incrementCounter());
			} else {
			  WeightedList wL = new WeightedList(j,1);
        WWTW.add(wL);
			}
		}

  List<String> chosenClothes = [];

  WWTW.forEach(r) {
	  if ( r.getcounter > 3){
	    chosenClothes.add(r.getClothes);
	  }
  }
  
  List<String> getChosenClothes(){
    return chosenClothes;
  }
}