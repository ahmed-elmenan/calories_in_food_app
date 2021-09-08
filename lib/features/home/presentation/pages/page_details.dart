import 'dart:convert';

import 'package:fapp/features/ads/data/utils/ads_global_utils.dart';
import 'package:fapp/features/home/presentation/consts/json_map.dart';
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
  bool showAd = false;
  Future<List<FoodModel>> getData() async {
    return await Future.delayed(Duration(seconds: 0), () {
      print(widget.nameCategorie);
      List<dynamic> data = jsonDecode(foodJsonMap[widget.nameCategorie]);
      setState(() {
        categorie_model = data.map((data) => FoodModel.fromJson(data)).toList();
      });
      return categorie_model;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    page_details.myBanner = BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (Ad ad) async {
          print(ad.responseInfo.responseId);
          if (await AdsGlobalUtils.isAdDisplayable(
              "appr", 'banner')) {
            print("BANNER HAS BEEN APPROVED");
          } else {
            ad.dispose();
            page_details.myBanner.load();
            print("BANNER NOT APPROVED");
          }
        }));
    page_details.myBanner.load();
  }

  addKcal() {
    setState(() {
      Card_details.calories;
      Card_details.carb;
      Card_details.fat;
      Card_details.proteins;
    });
  }

  bool ft_toshow() {
    // setState(() {

    // myBanner.load();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    AppBar(
                      automaticallyImplyLeading: false,
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            DropdownButton<String>(
                              hint: Text("carb"),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.white),
                            ),
                            DropdownButton<String>(
                              hint: Text("fat"),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.white),
                            ),
                            DropdownButton<String>(
                              hint: Text("prot"),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Wrap(
                      children: _buildList(categorie_model.length),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 3,
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: /* trenary to check if the id exist in the db then take an action*/
                        AdWidget(ad: page_details.myBanner)),
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
