import 'dart:convert';

import 'package:fapp/core/data/viande.dart';
import 'package:fapp/features/home/presentation/pages/page_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/models/dataobject.dart';

class Card_details extends StatefulWidget {
  FoodModel categorieModel;

  Card_details({this.categorieModel});
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
          Row(
            children: <Widget>[
              Text(
                widget.categorieModel.name,
                style: TextStyle(fontSize: 35),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _Columns(widget.categorieModel.calories.toString(),
                  widget.categorieModel.calories.toString()),
              _Columns(widget.categorieModel.carb.toString(),
                  widget.categorieModel.carb.toString()),
              _Columns(widget.categorieModel.proteins.toString(),
                  widget.categorieModel.proteins.toString()),
              _Columns(widget.categorieModel.fat.toString(),
                  widget.categorieModel.fat.toString()),
              Column(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                    Icons.add,
                  ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
