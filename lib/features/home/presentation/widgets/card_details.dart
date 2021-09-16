import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/widgets/bottom_sheet_sub_title.dart';
import 'package:fapp/features/ads/services/ads_manager.dart';
import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../data/models/dataobject.dart';

class Card_details extends StatefulWidget {
  FoodModel categorieModel;
  Function(int) addCal;
  static double calories = 0;
  static double proteins = 0;
  static double carb = 0;
  static double fat = 0;
  static double remaining = 0;
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
          value = (value == "null") ? "0" : value + " g",
          style: TextStyle(fontSize: 20, fontFamily: "greycliff-cf-regular"),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 10,
            fontFamily: "greycliff-cf-regular",
            color: GlobalTheme.lightOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _titleOfcard(String title) {
    return Row(
      children: <Widget>[
        Container(
          // width: MediaQuery.of(context).size.width / 1.2,
          child: Text(
            "$title \n(100 g)",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "greycliff-cf-regular",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> draggableScrollable(
      BuildContext context, double rating, FoodModel foodModel) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            expand: false,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(foodModel.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            color: GlobalTheme.customedBlack,
                            fontWeight: FontWeight.bold,
                            fontFamily: "greycliff-cf-regular")),
                    BottomSheetSubTitle(subTitle: "Select Quantity"),
                    Column(
                      children: [
                        Text(rating.toStringAsFixed(0) + " g",
                            style: TextStyle(
                                fontSize: 24,
                                color: GlobalTheme.lightGreen,
                                fontWeight: FontWeight.bold,
                                fontFamily: "greycliff-cf-regular")),
                        Slider(
                            activeColor: GlobalTheme.lightGreen,
                            inactiveColor: Colors.green.shade100,
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
                      ],
                    ),
                    BottomSheetSubTitle(subTitle: "Food Macros"),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 40,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: GlobalTheme.shadeOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              // showInter();
                              AdsManager.interListener();
                              AdsManager.showInter();
                              setState(() {
                                Card_details.calories += widget.calories_tmp;
                                Card_details.carb += widget.carb_tmp;
                                Card_details.fat += widget.fat_tmp;
                                Card_details.proteins += widget.proteins_tmp;
                                Card_details.remaining -= widget.calories_tmp;
                                final mybox = Boxes.getQuestions();
                                final quetion = mybox.get('key');
                                quetion.fat = Card_details.fat;
                                quetion.carb = Card_details.carb;
                                quetion.prot = Card_details.proteins;
                                quetion.eating = Card_details.calories;
                                quetion.remining = Card_details.remaining;
                                if (quetion == null)
                                  mybox.put('key', quetion);
                                else {
                                  quetion.save();
                                }
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text(
                              "confirme",
                              style: TextStyle(
                                  fontFamily: "greycliff-cf-regular",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                      ),
                    ),
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
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                // mainAxisSize: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2, child: _titleOfcard(widget.categorieModel.name)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _Columns(widget.categorieModel.proteins.toString(),
                            "proteins."),
                        _Columns(widget.categorieModel.fat.toString(), "fat."),
                        _Columns(
                            widget.categorieModel.carb.toString(), "carsb."),
                        _Columns(
                            widget.categorieModel.calories.toString(), "Kcal."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 40,
                      color: GlobalTheme.lightGreen,
                    ),
                    onPressed: () {
                      AdsManager.createInterAd();
                      setState(() {
                        draggableScrollable(
                            context, rating, widget.categorieModel);
                        widget.calories_tmp = double.parse(
                            widget.categorieModel.calories.toString());
                        widget.proteins_tmp = widget.categorieModel.proteins;
                        widget.carb_tmp = widget.categorieModel.carb;
                        widget.fat_tmp = widget.categorieModel.fat;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
