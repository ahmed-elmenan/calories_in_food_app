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
                Text("${Card_details.calories.toStringAsFixed(2)} Cal",
                    style: headertextStyle),
                SizedBox(height: 8),
                Text("Remaining", style: headertextStyle),
                Text("${Card_details.remaining} Cal", style: headertextStyle),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    macroPerGrame("carb", Card_details.carb.toStringAsFixed(2)),
                    verticalDivider(),
                    macroPerGrame("fat", Card_details.fat.toStringAsFixed(2)),
                    verticalDivider(),
                    macroPerGrame(
                        "prot", Card_details.proteins.toStringAsFixed(2)),
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
}
