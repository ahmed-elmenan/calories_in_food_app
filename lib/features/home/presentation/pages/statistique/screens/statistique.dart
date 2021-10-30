import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:fapp/features/home/presentation/pages/statistique/charts/chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as fl_chart;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class Statistique extends StatefulWidget {
  Statistique({Key key}) : super(key: key);

  @override
  _StatistiqueState createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {
  Box<Firstpage> boxofday;

  @override
  void initState() {
    // TODO: implement initState
    boxofday = Boxes.getBoxofDays();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .9,
            child: fl_chart.BarChart(
              fl_chart.BarChartData(barGroups: [
                Charts.chartgroup(0, boxofday.get(0)),
                Charts.chartgroup(1, boxofday.get(1)),
                Charts.chartgroup(2, boxofday.get(2)),
                Charts.chartgroup(3, boxofday.get(3)),
                Charts.chartgroup(4, boxofday.get(4)),
                Charts.chartgroup(5, boxofday.get(5)),
                Charts.chartgroup(6, boxofday.get(6)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
