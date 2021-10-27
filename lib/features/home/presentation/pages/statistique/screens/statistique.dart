import 'package:fapp/features/home/presentation/pages/statistique/charts/chart.dart';
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
    Charts.laond();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .9,
            child: BarChart(
              BarChartData(barGroups: [
                Charts.chartgroup(0, Charts.listoftheday[0]),
                Charts.chartgroup(1, Charts.listoftheday[1]),
                Charts.chartgroup(2, Charts.listoftheday[2]),
                Charts.chartgroup(3, Charts.listoftheday[3]),
                Charts.chartgroup(4, Charts.listoftheday[4]),
                Charts.chartgroup(5, Charts.listoftheday[5]),
                Charts.chartgroup(6, Charts.listoftheday[6]),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
