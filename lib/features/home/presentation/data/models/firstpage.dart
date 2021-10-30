import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'firstpage.g.dart';

@HiveType()
class Firstpage extends HiveObject with ChangeNotifier {
  Firstpage();
  @HiveField(0)
  int typeExercise;
  @HiveField(1)
  bool isvisible = false;
  @HiveField(2)
  int Gender;
  @HiveField(3)
  double Age;
  @HiveField(4)
  double Length;
  @HiveField(5)
  double Weight;
  @HiveField(6)
  double _eating;

  @HiveField(7)
  double _carb;
  @HiveField(8)
  double _fat;
  @HiveField(9)
  double _prot;
  @HiveField(10)
  double remining;
  @HiveField(11)
  DateTime initialzingDate;
  @HiveField(12)
  double totalCal;
  Firstpage.init(this._carb,this._fat,this._prot,this._eating,this.remining);
  set eating(double val) {
    _eating = val;
    notifyListeners();
  }

  double get eating => this._eating;

  set carb(double val) {
    _carb = val;
    notifyListeners();
  }

  double get carb => this._carb;

  set fat(double val) {
    _fat = val;
    notifyListeners();
  }

  double get fat => this._fat;

  set prot(double val) {
    _prot = val;
    notifyListeners();
  }

  double get prot => this._prot;

  double is_Man(double Age, double Length, double Weight) {
    return 66.47 + (13.75 * Weight) + (5.003 * Length) - (6.755 * Age);
  }

  double isWomen(double Age, double Length, double Weight) {
    return 655.1 + (9.563 * Weight) + (1.85 * Length) - (4.676 * Age);
  }

  double notExercise(double Bmr) {
    return Bmr * 1.2;
  }

  double lightExercise(double Bmr) {
    return Bmr * 1.375;
  }

  double moderateExercise(double Bmr) {
    return Bmr * 1.55;
  }

  double veryActive(double Bmr) {
    return Bmr * 1.725;
  }

  double extraActive(double Bmr) {
    return Bmr * 1.9;
  }
}
