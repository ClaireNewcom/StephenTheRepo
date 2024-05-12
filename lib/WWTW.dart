import 'WeightedList.dart';
import 'clothes.dart';
import 'WeatherConditions.dart';

///This class creates a List<String> that represents the clothing that should be
///worn based on how many times each article of clothing is counted.
class WWTW {

	List<WeightedList> WWTWear = [];
  List<String> calculatedClothes = [];


	///Returns a future List<String> using the input [input] of List<WeatherConditions>.
	///The clothing class is called and creates a list of clothing items for each item in [input],
	///and these lists are combined. A List<WeightedList> is developed, where each object of WeightedList contains
	///a clothing item and how many times it has appeared. Based on how many times an article of clothing
	/// is counted, clothing items are added to a list and the list is returned.
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
      if (WWTWear[r].getClothes().contains('umbrella') && !chosenClothes.contains('umbrella')){
			chosenClothes.add('umbrella');
		  }
      if (WWTWear[r].getClothes().contains('raincoat') && !chosenClothes.contains('raincoat')){
			chosenClothes.add('raincoat');
		  }
      if (WWTWear[r].getClothes().contains('windbreaker coat') && !chosenClothes.contains('windbreaker coat')){
			chosenClothes.add('windbreaker coat');
		  }
		}
		return chosenClothes;
	}

}