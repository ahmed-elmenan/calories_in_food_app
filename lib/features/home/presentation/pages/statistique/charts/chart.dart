import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:fapp/features/home/presentation/data/models/dataobject.dart';
import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Charts {
  static List<FoodModel> listoftheday = [];
  static BarChartGroupData chartgroup(int _x, FoodModel data) {
    BarChartGroupData barchart = BarChartGroupData(x: _x, barRods: [
      BarChartRodData(
          y: data.carb,
          colors: [Colors.amberAccent],
          width: 10,
          borderRadius: BorderRadius.circular(30)),
      BarChartRodData(
          y: data.fat,
          colors: [Colors.green],
          width: 10,
          borderRadius: BorderRadius.circular(30)),
      BarChartRodData(
          y: data.proteins,
          colors: [Colors.red],
          width: 10,
          borderRadius: BorderRadius.circular(30)),
    ]);
    return barchart;
  }

  static void laond() {
    FoodModel foodmodel = FoodModel(
        name: "ddd", fat: 5.8, proteins: 5.6, carb: 4.5, calories: 5.5);
    Charts.listoftheday = List.filled(
        7, FoodModel(name: "ddd", fat: 0, proteins: 0, carb: 0, calories: 0));
    for (var i = 0; i < 2; i++) {
      Charts.listoftheday[i] = foodmodel;
    }
  }
}
