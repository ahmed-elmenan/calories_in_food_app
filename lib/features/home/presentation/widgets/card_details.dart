import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../data/models/dataobject.dart';

class Card_details extends StatefulWidget {
  FoodModel categorieModel;
  Function(int) addCal;
  static double calories = 0;
  static double proteins = 0;
  static double carb = 0;
  static double fat = 0;
  static double remaining = 2655;
  double calories_tmp = 0;
  double proteins_tmp = 0;
  double carb_tmp = 0;
  double fat_tmp = 0;
  Card_details({this.categorieModel, this.addCal});
  @override
  _Card_detailsState createState() => _Card_detailsState();
}

class _Card_detailsState extends State<Card_details> {
  void calcul(double rating) {
    double rest = 0.0;
    if (widget.categorieModel.calories.toString() != "null") {
      rest = (rating * widget.categorieModel.calories) / 100;
      widget.calories_tmp = rest;
    }
    if (widget.categorieModel.fat.toString() != "null") {
      rest = (rating * widget.categorieModel.fat) / 100;
      widget.fat_tmp = rest;
    }
    if (widget.categorieModel.carb.toString() != "null") {
      rest = (rating * widget.categorieModel.carb) / 100;
      widget.carb_tmp = rest;
    }
    if (widget.categorieModel.proteins.toString() != "null") {
      rest = (rating * widget.categorieModel.proteins) / 100;
      widget.proteins_tmp = rest;
    }
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
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Text(
            "$title \n(100 g)",
            style: TextStyle(fontSize: 20),
          ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("$rating\g"),
                      ],
                    ),
                    Slider(
                      
                        activeColor: Colors.red,
                        inactiveColor: Colors.red.shade100,
                        value: rating,
                        min: 0,
                        max: 500,
                        divisions: 100,
                        onChanged: (_myvalue) {
                          setState(() {
                            rating = _myvalue;
                            calcul(rating);
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Columns(widget.categorieModel.proteins.toString(),
                            "proteins."),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(widget.categorieModel.fat.toString(), "fat."),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(
                            widget.categorieModel.carb.toString(), "carsb."),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(
                            widget.categorieModel.calories.toString(), "Kcal."),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Columns(
                            widget.proteins_tmp.toStringAsFixed(2).toString(),
                            "proteins."),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(widget.fat_tmp.toStringAsFixed(2).toString(),
                            "fat."),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(widget.carb_tmp.toStringAsFixed(2).toString(),
                            "carsb."),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(
                            widget.calories_tmp.toStringAsFixed(2).toString(),
                            "Kcal."),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Card_details.calories += widget.calories_tmp;
                            Card_details.carb += widget.carb_tmp;
                            Card_details.fat += widget.fat_tmp;
                            Card_details.proteins += widget.proteins_tmp;
                            Card_details.remaining =
                                Card_details.remaining - Card_details.calories;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("confirme")),
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
    double rating = 100;
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
                        widget.calories_tmp = 0;
                        widget.proteins_tmp = 0;
                        widget.carb_tmp = 0;
                        widget.fat_tmp = 0;
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
