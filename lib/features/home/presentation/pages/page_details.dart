import 'dart:async';
import 'dart:convert';

import 'package:fapp/features/ads/data/utils/ads_global_utils.dart';
import 'package:fapp/features/home/presentation/consts/json_map.dart';
import 'package:fapp/features/home/presentation/data/datasources/foodLocalDataSource.dart';
import 'package:fapp/features/home/presentation/data/datasources/foodLocalDataSource.dart';
import 'package:fapp/features/home/presentation/pages/home_page.dart';
import 'package:fapp/features/home/presentation/widgets/card_details.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../data/models/dataobject.dart';

class page_details extends StatefulWidget {
  String nameCategorie;
  bool toShow = false;
  static BannerAd myBanner;

  page_details({this.nameCategorie});
  @override
  _page_detailsState createState() => _page_detailsState();
}

class _page_detailsState extends State<page_details> {
  List<FoodModel> categorie_model = [];
  bool showAd = true;
  Future<List<FoodModel>> getData() async {
    return await Future.delayed(Duration(seconds: 0), () {
      print(widget.nameCategorie);
      List<dynamic> data = jsonDecode(foodJsonMap[widget.nameCategorie]);
      setState(() {
        categorie_model = data.map((data) => FoodModel.fromJson(data)).toList();
      });
      foodListSaver = List.from(categorie_model);
      return categorie_model;
    });
  }

  showAdState(bool val) {
    setState(() {
      showAd = val;
      if (showAd == false) {
        print(showAd);
        page_details.myBanner.load();
        i = 2;
      } else {
        i++;
      }
    });
  }

  List tab = ["dwkfjvdfkw", "12", "dwkfjvdfkw"];
  int i = 0;

  List<FoodModel> foodListSaver;
  @override
  void initState() {
    super.initState();
    getData();

    // print("LLLLLLLEEEEEEEENNNNNNN +>" + foodListSaver.length.toString());
    // print("LLLLLLLEEEEEEEENNNNNNN +>" + categorie_model.length.toString());
    foodLocalDataSource = IFoodLocalDataSource();
    page_details.myBanner = BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (Ad ad) async {
          print("==AD ID=>" + ad.responseInfo.responseId);
          if (await AdsGlobalUtils.isAdDisplayable(
              ad.responseInfo.responseId, 'banner')) {
            print(
                "BANNER HAS BEEN APPROVED =====================================================");
            showAdState(true);
          } else {
            ad.dispose();
            showAdState(false);
            print(
                "BANNER NOT APPROVED =====================================================");
          }
        }));
    page_details.myBanner.load();
  }

  final _controller = ScrollController();
  int _croissance = 0;
  TextEditingController _textController = TextEditingController();
  addKcal() {
    setState(() {
      Card_details.calories;
      Card_details.carb;
      Card_details.fat;
      Card_details.proteins;
    });
  }

  Widget appBarSort(
      IFoodLocalDataSource foodLocalDataSource, int prop, String title) {
    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        setState(() {
          _croissance = (_croissance >= 0) ? -1 : 1;
          categorie_model = List.from(
              foodLocalDataSource.getSort(foodListSaver, _croissance, prop));
          _controller.animateTo(
            _controller.position.minScrollExtent,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
        });
      },
      child: Text(title),
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
  IFoodLocalDataSource foodLocalDataSource;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => FoodCaloriesApp());
              Navigator.push(context, route).then(addKcal());
            },
          ),
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          appBarSort(foodLocalDataSource, 1, "prot"),
                          appBarSort(foodLocalDataSource, 2, "Fat"),
                          appBarSort(foodLocalDataSource, 3, "Carb"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 60,
                    // color: Colors.red,
                    child: Form(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 17),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: _textController,
                                onChanged: (String value) {
                                  // bloc event here
                                  setState(() {
                                    categorie_model = List.from(
                                        foodLocalDataSource.getSerchedFood(
                                            foodListSaver, value));
                                    _controller.animateTo(
                                      _controller.position.minScrollExtent,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn,
                                    );
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "search for foods",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF979BA3),
                                  ),
                                  // filled: true,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    _textController.clear();
                                    setState(() {
                                      categorie_model =
                                          List.from(foodListSaver);
                                    });
                                  },
                                  child: Container(
                                      height: 30,
                                      child: Icon(
                                        Icons.close,
                                        color: Color(0xFF979BA3),
                                      )),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Wrap(
                  //   children: _buildList(categorie_model.length),
                  // ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          controller: _controller,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: categorie_model.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: new EdgeInsets.all(8.0),
                                child: Card_details(
                                    categorieModel: categorie_model[index]));
                          }),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 3,
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: /* trenary to check if the id exist in the db then take an action*/
                        Visibility(
                            visible: showAd,
                            child: AdWidget(ad: page_details.myBanner))),
              ),
            ],
          ),
        ));
  }

  List _buildList(int count) {
    List<Widget> listItems = [];
    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(8.0),
          child: Card_details(categorieModel: categorie_model[i])));
    }
    return listItems;
  }
}
