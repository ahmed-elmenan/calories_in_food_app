import 'package:fapp/features/home/presentation/pages/page_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Card_details extends StatelessWidget {
  // Map<String, dynamic> foodCategorie;

  // Card_details({this.foodCategorie});
  // row fih les culoom
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 5),
      height: size.height / 7 - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('BUY TICKETS', style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('BUY TICKETS'),
              const SizedBox(
                width: 8,
                height: 5,
              ),
              Text('LISTEN'),
              const SizedBox(
                width: 8,
                height: 5,
              ),
              Text('LISTEN'),
              const SizedBox(
                width: 7,
                height: 5,
              ),
              Text('LISTEN'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('BUY TICKETS'),
              // const SizedBox(width: 8),
              Text('LISTEN'),
              // const SizedBox(width: 8),
              Text('LISTEN'),
              // const SizedBox(width: 7),
              Text('LISTEN'),
            ],
          ),
        ],
      ),
    );
  }
}
