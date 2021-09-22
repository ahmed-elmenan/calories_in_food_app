import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/widgets/bottom_sheet_sub_title.dart';
import 'package:fapp/features/ads/services/ads_manager.dart';
import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sweetalertv2/sweetalertv2.dart';
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
        Expanded(
          child: Container(
            child: Text(
              "$title \n(100 g)",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "greycliff-cf-regular",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    calcul(100);
  }

  Future<dynamic> draggableScrollable(
      BuildContext context, double rating, FoodModel foodModel) {
    TextStyle confirmAlert =
        TextStyle(fontFamily: "greycliff-cf-regular", fontSize: 16);
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
                            "protein"),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(widget.fat_tmp.toStringAsFixed(2).toString(),
                            "fat."),
                        SizedBox(
                          width: 20,
                        ),
                        _Columns(widget.carb_tmp.toStringAsFixed(2).toString(),
                            "carb."),
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
                              setState(() {
                                final mybox = Boxes.getQuestions();
                                final quetion = mybox.get('key');
                                Card_details.calories += widget.calories_tmp;
                                Card_details.carb += widget.carb_tmp;
                                Card_details.fat += widget.fat_tmp;
                                Card_details.proteins += widget.proteins_tmp;
                                Card_details.remaining -= widget.calories_tmp;
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
                              SweetAlertV2.show(context,
                                  title: "${widget.categorieModel.name} Added",
                                  subtitle:
                                      "${widget.calories_tmp.toStringAsFixed(2)} calories of ${widget.categorieModel.name} Added",
                                  style: SweetAlertV2Style.success,
                                  confirmButtonColor: GlobalTheme.lightGreen,
                                  subtitleTextAlign: TextAlign.center,
                                  titleStyle: confirmAlert.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  subtitleStyle: confirmAlert, onPress: (val) {
                                AdsManager.interListener();
                                AdsManager.showInter();
                                return true;
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

  final focusNode = FocusNode();

// ...

  @override
  Widget build(BuildContext context) {
    double rating = 100;
    Size size = MediaQuery.of(context).size;
    calcul(100);
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
                            "protein."),
                        _Columns(widget.categorieModel.fat.toString(), "fat."),
                        _Columns(
                            widget.categorieModel.carb.toString(), "carb."),
                        _Columns(
                            widget.categorieModel.calories.toString(), "Kcal."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                    focusNode.unfocus();

                    AdsManager.createInterAd();
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      widget.calories_tmp = double.parse(
                          widget.categorieModel.calories.toString());
                      widget.proteins_tmp = widget.categorieModel.proteins;
                      widget.carb_tmp = widget.categorieModel.carb;
                      widget.fat_tmp = widget.categorieModel.fat;
                    });
                    draggableScrollable(context, rating, widget.categorieModel);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
