import 'dart:async';
import 'dart:convert';

import 'package:fapp/core/consts/admob-info.dart';
import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/widgets/shareButton.dart';
import 'package:fapp/core/widgets/vertical_divider.dart';
import 'package:fapp/features/ads/data/utils/ads_global_utils.dart';
import 'package:fapp/features/home/presentation/consts/json_map.dart';
import 'package:fapp/features/home/presentation/data/datasources/foodLocalDataSource.dart';
import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:fapp/features/home/presentation/pages/home_page.dart';
import 'package:fapp/features/home/presentation/widgets/card_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../data/models/dataobject.dart';

class page_details extends StatefulWidget {
  String nameCategorie;
  bool toShow = false;

  page_details({this.nameCategorie});
  @override
  _page_detailsState createState() => _page_detailsState();
}

class _page_detailsState extends State<page_details>
    with SingleTickerProviderStateMixin {
  List<FoodModel> categorie_model = [];
  bool showAd = true;
  Future<List<FoodModel>> getData() async {
    return await Future.delayed(Duration(seconds: 0), () {
      List<dynamic> data = jsonDecode(foodJsonMap[widget.nameCategorie]);
      setState(() {
        try {
          categorie_model =
              data.map((data) => FoodModel.fromJson(data)).toList();
        } catch (e) {
          print(e.toString());
        }
      });
      foodListSaver = List.from(categorie_model);
      return categorie_model;
    });
  }

  Timer timer;
  showAdState(bool val) {
    if (mounted) {
      setState(() {
        showAd = val;
        if (showAd == false) {
          print(showAd);
          timer =
              Timer.periodic(Duration(minutes: 1), (Timer t) => banner.load());
        }
      });
    }
  }

  List<FoodModel> foodListSaver;
  AnimationController _animationController;
  BannerAd banner;
  @override
  void initState() {
    super.initState();
    getData();
    macrosInit();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    Timer(Duration(milliseconds: 200), () => _animationController.forward());

    userInfo.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    foodLocalDataSource = IFoodLocalDataSource();
    banner = BannerAd(
        adUnitId: FCC_DETAIL_BANNER,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (Ad ad) async {
          print("==AD ID=>" + ad.responseInfo.responseId);
          try {
            if (await AdsGlobalUtils.isAdDisplayable(
                ad.responseInfo.responseId, 'banner')) {
              print(
                  "BANNER HAS BEEN APPROVED ========");
              showAdState(true);
            } else {
              ad.dispose();
              showAdState(false);
              print(
                  "BANNER NOT APPROVED =======");
            }
          } catch (e) {
            print(e.toString());
          }
        }));
    banner.load();
  }

  final _controller = ScrollController();
  int _croissance = 0;
  TextEditingController _textController = TextEditingController();

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: "greycliff-cf-regular",
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 4,
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: FaIcon(FontAwesomeIcons.sortUp)),
        ],
      ),
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    minimumSize: Size(80, 36),
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
  IFoodLocalDataSource foodLocalDataSource;

  Future<bool> backToTheHome(BuildContext context) {
    // FoodCaloriesApp.of(context).updateState();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FoodCaloriesApp()),
    );
    return Future.value(true);
  }

  TextStyle headertextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "greycliff-cf-regular");

  Firstpage userInfo;

  macrosInit() {
    final mybox = Boxes.getQuestions();
    userInfo = mybox.get('key');
  }

  Widget macroPerGrame(String name, String value) {
    TextStyle macroStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "greycliff-cf-regular");

    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Text("$name", style: macroStyle),
          SizedBox(height: 8),
          Text("$value" + " g", style: macroStyle),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _animationController.dispose();
    // timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backToTheHome(context),
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(180.0),
            child: AppBar(
              title: Center(
                child: Text(
                  widget.nameCategorie,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: "greycliff-cf-regular",
                    // fontFamily: "GrechenFuemen-Regular"
                  ),
                ),
              ),
              actions: <Widget>[
                ShareButton(),
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      GlobalTheme.lightOrange,
                      GlobalTheme.shadeOrange,
                    ])),
                padding: EdgeInsets.only(top: 70),
                child: SlideTransition(
                  position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                      .animate(_animationController),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Eaten",
                                  style: headertextStyle,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${userInfo.eating.toStringAsFixed(2)} Cal",
                                  style: headertextStyle,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Remaining",
                                  style: headertextStyle,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${Card_details.remaining.toStringAsFixed(2)} Cal",
                                  style: headertextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            macroPerGrame(
                                "Carb", userInfo.carb.toStringAsFixed(2)),
                            VerticalLineDivider(),
                            macroPerGrame(
                                "Fat", userInfo.fat.toStringAsFixed(2)),
                            VerticalLineDivider(),
                            macroPerGrame(
                                "Protein", userInfo.prot.toStringAsFixed(2)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // backgroundColor: GlobalTheme.lightOrange,
              leading: new IconButton(
                icon: new Icon(Icons.chevron_left),
                onPressed: () => backToTheHome(context),
              ),
            ),
          ),
          body: Center(
            child: Stack(
              children: [
                SlideTransition(
                  position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                      .animate(_animationController),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: GlobalTheme.lightGreen,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      appBarSort(
                                          foodLocalDataSource, 1, "Protein"),
                                      appBarSort(foodLocalDataSource, 2, "Fat"),
                                      appBarSort(
                                          foodLocalDataSource, 3, "Carb"),
                                      appBarSort(foodLocalDataSource, 4, "Cal"),
                                    ],
                                  ),
                                ),
                              ),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 17),
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
                                        categorieModel:
                                            categorie_model[index]));
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 3,
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: /* trenary to check if the id exist in the db then take an action*/
                          Visibility(
                              visible: showAd, child: AdWidget(ad: banner))),
                ),
              ],
            ),
          )),
    );
  }
}
