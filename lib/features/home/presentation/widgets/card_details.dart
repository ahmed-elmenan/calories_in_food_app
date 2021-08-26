import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../data/models/dataobject.dart';

class Card_details extends StatefulWidget {
  FoodModel categorieModel;
  Function(int) addCal;
  static int calories = 0;
  static double proteins = 0;
  static double carb = 0;
  static double fat = 0;
  Card_details({this.categorieModel, this.addCal});
  @override
  _Card_detailsState createState() => _Card_detailsState();
}

class _Card_detailsState extends State<Card_details> {
  void calcul() {
    if (widget.categorieModel.calories.toString() != "null")
      Card_details.calories += widget.categorieModel.calories;
    if (widget.categorieModel.fat.toString() != "null")
      Card_details.fat += widget.categorieModel.fat;
    if (widget.categorieModel.carb.toString() != "null")
      Card_details.carb += widget.categorieModel.carb;
    if (widget.categorieModel.proteins.toString() != "null")
      Card_details.proteins += widget.categorieModel.proteins;
  }

  Widget _Columns(String value, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          value = (value == "null") ? "0" : value,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          name,
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
  
  Future<dynamic> draggableScrollable(BuildContext context, double rating) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            expand: false,
            builder: (context, controller) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Slider(
                        activeColor: Colors.red,
                        inactiveColor: Colors.red.shade100,
                        value: rating,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        onChanged: (_myvalue) {
                          setState(() {
                            rating = _myvalue;
                          });
                        }),
                  ],
                ),
              );
            },
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double rating = 50;
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
              _Columns(widget.categorieModel.carb.toString(), "carsb."),
              _Columns(widget.categorieModel.calories.toString(), "Kcal."),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      setState(() {
                        draggableScrollable(context, rating);
                      });
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
