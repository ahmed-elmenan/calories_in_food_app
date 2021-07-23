import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: size.height / 7,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: double.infinity,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/fruits.jpg"),
                backgroundColor: Colors.transparent,
              )),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Text(
              "Fruits",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          FaIcon(FontAwesomeIcons.chevronRight),
        ],
      ),
    );
  }
}
