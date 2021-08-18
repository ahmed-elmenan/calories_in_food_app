class FoodModel {
  String _name;
  double _proteins;
  double _fat;
  double _carb;
  int _calories;

  FoodModel(
      {String name, double proteins, double fat, double carb, int calories}) {
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
  int get calories => _calories;
  set calories(int calories) => _calories = calories;

  FoodModel.fromJson(Map<String, dynamic> json) {
    _name = json['Name'];
    _proteins = json['proteins'];
    _fat = json['Fat'];
    _carb = json['Carb'];
    _calories = json['calories'];
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