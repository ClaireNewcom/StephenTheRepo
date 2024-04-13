import 'WeightedList.dart';
import 'clothes.dart';

class WWTW {

	List<WeightedList> WWTWear = [];
  List<String> calculatedClothes = [];

	WWTW(weatherCondition){
		Clothes c = new Clothes(weatherCondition);
		calculatedClothes = c.clothingChoice();
	}


	List<String> WhatToWear(temp, wind, humidity, weatherType) {
		for(int i =0; i<3; i++){
			Clothes c = new Clothes.forQuiz(temp, wind, humidity, weatherType);
			List<String> calculatedClothes = c.clothingChoice();

			for(int j = 0; j < calculatedClothes.length; j++){
				for(int g = 0; g < WWTWear.length; g++){
					if(WWTWear[g].getClothes() == calculatedClothes[j]) {
						WWTWear[g].incrementCounter();
					}
					else {
						WeightedList wL = new WeightedList.addElement(calculatedClothes[j], 1);
						WWTWear.add(wL);
					}
				}

			}

		}

		List<String> chosenClothes = [];

		for (int r = 0; r < WWTWear.length; r++) {
			if (WWTWear[r].getCounter() > 3){
				chosenClothes.add(WWTWear[r].getClothes());
			}
		}
		return chosenClothes;

	}


/*calculatedClothes.forEach(j){
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
  }*/
}