import 'package:flutter/material.dart';
import '../data/models/dataobject.dart';


class Card_details extends StatefulWidget {
  FoodModel categorieModel;
  Function(int) addCal;
  static int globaleKcal = 0;
  Card_details({this.categorieModel, this.addCal});
  @override
  _Card_detailsState createState() => _Card_detailsState();
}

class _Card_detailsState extends State<Card_details> {
  Widget _Columns(String name, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  Widget _titleOfcard(String title) {
    return Row(
      children: <Widget>[
        Text(
          "$title (100 g)",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 5),
      height: size.height / 7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _titleOfcard(widget.categorieModel.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _Columns(widget.categorieModel.proteins.toString(), "proteins."),
              _Columns(widget.categorieModel.fat.toString(), "fat."),
              _Columns(widget.categorieModel.carb.toString(), "carb."),
              _Columns(widget.categorieModel.calories.toString(), "Kcal."),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      Card_details.globaleKcal += widget.categorieModel.calories;
                      print(Card_details.globaleKcal);
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
