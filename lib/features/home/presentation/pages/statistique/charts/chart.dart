import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fapp/features/home/presentation/data/models/firstpage.dart';

class Charts {
  static BarChartGroupData chartgroup(int _x, Firstpage data) {
    BarChartGroupData barchart = BarChartGroupData(x: _x, barRods: [
      BarChartRodData(
          y: (data.carb == 0) ? 0 : data.carb,
          colors: [Colors.amberAccent],
          width: 10,
          borderRadius: BorderRadius.circular(30)),
      BarChartRodData(
          y: (data.fat == 0) ? 0 : data.fat,
          colors: [Colors.green],
          width: 10,
          borderRadius: BorderRadius.circular(30)),
      BarChartRodData(
          y: (data.prot == 0) ? 0 : data.prot,
          colors: [Colors.red],
          width: 10,
          borderRadius: BorderRadius.circular(30)),
    ]);
    return barchart;
  }
}

class Macros {
  double macro;
  String name;
  Color colorv;
  Macros({this.name, this.macro, this.colorv});
}
class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}