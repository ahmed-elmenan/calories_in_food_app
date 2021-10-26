import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class Statistique extends StatefulWidget {
  Statistique({Key key}) : super(key: key);

  @override
  _StatistiqueState createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .9,
            child: BarChart(
              BarChartData(barGroups: [
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                      y: 2,
                      colors: [Colors.amberAccent],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 3,
                      colors: [Colors.green],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 1.5,
                      colors: [Colors.red],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(
                      y: 2,
                      colors: [Colors.amberAccent],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 3,
                      colors: [Colors.green],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 1.5,
                      colors: [Colors.red],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                      y: 2,
                      colors: [Colors.amberAccent],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 3,
                      colors: [Colors.green],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 1.5,
                      colors: [Colors.red],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                ]),
                BarChartGroupData(x: 4, barRods: [
                  BarChartRodData(
                      y: 2,
                      colors: [Colors.amberAccent],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 3,
                      colors: [Colors.green],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 1.5,
                      colors: [Colors.red],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                ]),
                BarChartGroupData(x: 5, barRods: [
                  BarChartRodData(
                      y: 2,
                      colors: [Colors.amberAccent],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 3,
                      colors: [Colors.green],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 1.5,
                      colors: [Colors.red],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                ]),
                BarChartGroupData(x: 6, barRods: [
                  BarChartRodData(
                      y: 2,
                      colors: [Colors.amberAccent],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 3,
                      colors: [Colors.green],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 1.5,
                      colors: [Colors.red],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                ]),
                BarChartGroupData(x: 7, barRods: [
                  BarChartRodData(
                      y: 2,
                      colors: [Colors.amberAccent],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 3,
                      colors: [Colors.green],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                  BarChartRodData(
                      y: 1.5,
                      colors: [Colors.red],
                      width: 10,
                      borderRadius: BorderRadius.circular(30)),
                ]),
              ]),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .9,
            child: LineChart(
              LineChartData(minX: 0, maxX: 6, maxY: 7, minY: 0, lineBarsData: [
                LineChartBarData(colors: [
                  Colors.black
                ], spots: [
                  FlSpot(0, 3),
                  FlSpot(1, 2),
                  FlSpot(2, 5),
                  FlSpot(3, 6),
                  FlSpot(4, 1.5),
                  FlSpot(5, 3.5),
                  FlSpot(6, 2),
                ]),
                LineChartBarData(colors: [
                  Colors.red
                ], spots: [
                  FlSpot(0, 2),
                  FlSpot(1, 2.5),
                  FlSpot(2, 2.65),
                  FlSpot(3, 1.4),
                  FlSpot(4, 3.2),
                  FlSpot(5, 4.5),
                  FlSpot(6, 2),
                ])
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
