import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({Key key}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  TextStyle headertextStyle =
      TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold);
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
                Text("0 Cal", style: headertextStyle),
                SizedBox(height: 8),
                Text("Remaining", style: headertextStyle),
                Text("2397 Cal", style: headertextStyle),
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/images/apple_home_logo.svg",
            height: 200,
          )
        ],
      ),
    );
  }
}
