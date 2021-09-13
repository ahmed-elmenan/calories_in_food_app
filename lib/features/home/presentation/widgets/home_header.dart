import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'card_details.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({Key key}) : super(key: key);
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  TextStyle headertextStyle =
      TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold);

  Widget verticalDivider() {
    return Container(
      width: 2,
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Color(0xFF818182),
    );
  }

  Widget macroPerGrame(String name, String value) {
    return Column(
      children: [
        Text("$value",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text("$name",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Firstpage quetion;

  macrosInit() {
    setState(() {
      final mybox = Boxes.getQuestions();
      quetion = mybox.get('key');
      Card_details.remaining = calacRemaining(quetion);
      if (quetion.eating != null) Card_details.remaining -= quetion.eating;
      Card_details.fat = quetion.fat;
      Card_details.carb = quetion.carb;
      Card_details.proteins = quetion.prot;
      Card_details.calories = quetion.eating;
    });
  }

  @override
  void initState() {
    macrosInit();
    quetion.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF09D093), Color(0xFF00B892)])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Eaten", style: headertextStyle),
                Text("${quetion.eating.toStringAsFixed(2)} Cal",
                    style: headertextStyle),
                SizedBox(height: 8),
                Text("Remaining", style: headertextStyle),
                Text("${Card_details.remaining.toStringAsFixed(2)} Cal",
                    style: headertextStyle),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    macroPerGrame("carb", quetion.carb.toStringAsFixed(2)),
                    verticalDivider(),
                    macroPerGrame("fat", quetion.fat.toStringAsFixed(2)),
                    verticalDivider(),
                    macroPerGrame("prot", quetion.prot.toStringAsFixed(2)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30, right: 15),
            child: SvgPicture.asset(
              "assets/images/apple_home_logo.svg",
              height: 150,
            ),
          )
        ],
      ),
    );
  }

  // double setOldInfos() {
  //   final mybox = Boxes.getQuestions();
  //   final quetion = mybox.get('key');
  //   return quetion.remining;
  // }

  double calacRemaining(dynamic quetion) {
    double bmr = 0;
    double Remaining = 0;
    if (quetion.Gender == 1)
      bmr = quetion.isWomen(quetion.Age, quetion.Length, quetion.Weight);
    else if (quetion.Gender == 2)
      bmr = quetion.is_Man(quetion.Age, quetion.Length, quetion.Weight);
    if (quetion.typeExercise == 1)
      Remaining = quetion.notExercise(bmr);
    else if (quetion.typeExercise == 2)
      Remaining = quetion.lightExercise(bmr);
    else if (quetion.typeExercise == 3)
      Remaining = quetion.notExercise(bmr);
    else if (quetion.typeExercise == 4)
      Remaining = quetion.moderateExercise(bmr);
    else if (quetion.typeExercise == 5) Remaining = quetion.extraActive(bmr);
    return Remaining;
  }
}
