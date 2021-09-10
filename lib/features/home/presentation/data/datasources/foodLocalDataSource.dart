import 'package:fapp/features/home/presentation/data/models/dataobject.dart';

abstract class FoodLocalDataSource {
  List<FoodModel> getSerchedFood(List<FoodModel> foodList, String foodName);
}

 class IFoodLocalDataSource implements FoodLocalDataSource {
  
  @override
  List<FoodModel> getSerchedFood(List<FoodModel> foodList, String foodName)  {
      var searchedFoodList =  foodList.where((food) => (food.name.contains(foodName))).toList();
    return searchedFoodList.length >= 1 ? searchedFoodList : [];
  }
}

