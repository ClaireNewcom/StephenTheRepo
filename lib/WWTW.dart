WWTW ArrayList<String> () {
	ArrayList<WeightedList> WWTW = new ArrayList<WeightedList>();
	DayWeather.forEach(weatherCondition){
		Clothes c = new Clothes (weatherCondition)//make it so it works for the new class structure(it has weatehrCondition variable from the class WeatherConditions)
		ArrayList<String> calculatedClothes = c.calcClothes;
		calculatedClothes.forEach(j){
			if(WWTW.contains(j)) {	
        WWTW.get(WWTW.indexof(j).incrementCounter());
			} else {
			  WeightedList wL = new WeightedList(j,1);
        WWTW.add(wL) 
			}
		}

	}

  ArrayList<String> chosenClothes = new ArrayList<String>();

  WWTW.forEach(r) {
	  if ( r.getcounter > 3){
	    chosenClothes.add(r.getClothes)
	  }
  }
  Return chosenClothes;

}
