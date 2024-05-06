import 'WeightedList.dart';
import 'clothes.dart';
import 'WeatherConditions.dart';

class WWTW {

	List<WeightedList> WWTWear = [];
  List<String> calculatedClothes = [];
	//List<String> chosenClothes = [];

	/*WWTW() {
		WWTWear = [];
		calculatedClothes = [];
	}*/


	Future<List<String>> whatToWear(List<WeatherConditions> input) async {
		for(int i =0; i<input.length; i++){
			Clothes c = Clothes(input[i]);
			List<String> midCalcClothes = await c.clothingChoice();
			for(int k = 0; k < midCalcClothes.length; k++){
				calculatedClothes.add(midCalcClothes[k]);
			}

		}

		for(int j = 0; j < calculatedClothes.length; j++){

			for(int g = 0; g < WWTWear.length; g++){
				if(WWTWear[g].getClothes() == calculatedClothes[j]) {
					WWTWear[g].incrementCounter();
					break;
				}
				else if (g == WWTWear.length - 1){
					WeightedList wL = WeightedList.addElement(calculatedClothes[j], 1);
					WWTWear.add(wL);
					break;
				}
				else{
					continue;
				}

				/*
					else {
						WeightedList wL = WeightedList.addElement(calculatedClothes[j], 1);
						WWTWear.add(wL);
						break;
					}*/

			}
			if (WWTWear.isEmpty){
				WeightedList wL = WeightedList.addElement(calculatedClothes[j], 1);
				WWTWear.add(wL);
			}

		}

		List<String> chosenClothes = [];

		for (int r = 0; r < WWTWear.length; r++) {
			if (WWTWear[r].getCounter() > 1){
				chosenClothes.add(WWTWear[r].getClothes());
			}
      if (WWTWear[r].getClothes().compareTo('umbrella') == 0 && chosenClothes.contains('umbrella')){
			chosenClothes.add('umbrella');
		  }
      if (WWTWear[r].getClothes().compareTo('raincoat') == 0 && !chosenClothes.contains('raincoat')){
			chosenClothes.add('raincoat');
		  }
      if (WWTWear[r].getClothes().compareTo('windbreaker coat') == 0 && !chosenClothes.contains('windbreaker coat')){
			chosenClothes.add('windbreaker coat');
		  }
		}
		return chosenClothes;
	}

	/*List<String> getChosenClothes() {
		return chosenClothes;
	}*/

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