import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem extends StatelessWidget {
  Widget redirectWidget;
  String title;
  IconData iconData;

  DrawerItem({this.title, this.iconData, this.redirectWidget});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => redirectWidget));
      },
      child: Container(
        color: Colors.white,
        height: 60,
        child: Center(
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(child: Center(child: FaIcon(iconData)))),
              Expanded(
                flex: 2,
                child: Text(title, style: TextStyle()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
