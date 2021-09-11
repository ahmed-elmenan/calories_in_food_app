import 'package:fapp/features/home/presentation/data/models/dataobject.dart';

abstract class FoodLocalDataSource {
  List<FoodModel> getSerchedFood(List<FoodModel> foodList, String foodName);
  List<FoodModel> getSortCarb(List<FoodModel> foodList, int _croissance);
  List<FoodModel> getSortFat(List<FoodModel> foodList, int _croissance);
  List<FoodModel> getSortProt(List<FoodModel> foodList, int _croissance);
}

class IFoodLocalDataSource implements FoodLocalDataSource {
  @override
  List<FoodModel> getSerchedFood(List<FoodModel> foodList, String foodName) {
    var searchedFoodList =
        foodList.where((food) => (food.name.contains(foodName))).toList();
    return searchedFoodList.length >= 1 ? searchedFoodList : [];
  }

  @override
  List<FoodModel> getSortCarb(List<FoodModel> foodList, int _croissance) {
    if (_croissance == 1)
      foodList.sort((a, b) => a.carb.compareTo(b.carb));
    else if (_croissance == -1)
      foodList.sort((a, b) => b.carb.compareTo(a.carb));
    return foodList;
  }

  @override
  List<FoodModel> getSortFat(List<FoodModel> foodList, int _croissance) {
    if (_croissance == 1)
      foodList.sort((a, b) => a.fat.compareTo(b.fat));
    else if (_croissance == -1) foodList.sort((a, b) => b.fat.compareTo(a.fat));
    return foodList;
  }

  @override
  List<FoodModel> getSortProt(List<FoodModel> foodList, int _croissance) {
    if (_croissance == 1)
      foodList.sort((a, b) => a.proteins.compareTo(b.proteins));
    else if (_croissance == -1)
      foodList.sort((a, b) => b.proteins.compareTo(a.proteins));
    return foodList;
  }

  @override
  List<FoodModel> getSort(List<FoodModel> foodList, int _croissance, int prop) {
    if (prop == 1) {
      getSortProt(foodList, _croissance);
    } else if (prop == 2) {
      getSortFat(foodList, _croissance);
    } else if (prop == 3) {
      getSortCarb(foodList, _croissance);
    }
    return foodList;
  }
}
