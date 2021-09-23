import 'package:fapp/core/utils/global_utils.dart';

class FoodModel {
  String _name;
  double _proteins;
  double _fat;
  double _carb;
  double _calories;

  FoodModel(
      {String name,
      double proteins,
      double fat,
      double carb,
      double calories}) {
    this._name = name;
    this._proteins = proteins;
    this._fat = fat;
    this._carb = carb;
    this._calories = calories;
  }

  String get name => _name;
  set name(String name) => _name = name;
  double get proteins => _proteins;
  set proteins(double proteins) => _proteins = proteins;
  double get fat => _fat;
  set fat(double fat) => _fat = fat;
  double get carb => _carb;
  set carb(double carb) => _carb = carb;
  double get calories => _calories;
  set calories(double calories) => _calories = calories;

  FoodModel.fromJson(Map<String, dynamic> json) {
    _name = json['Name'];
    _proteins = json['proteins'].toDouble();
    _fat = json['Fat'].toDouble();
    _carb = json['Carb'].toDouble();
    _calories = json['calories'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this._name;
    data['proteins'] = this._proteins;
    data['Fat'] = this._fat;
    data['Carb'] = this._carb;
    data['calories'] = this._calories;
    return data;
  }
}
