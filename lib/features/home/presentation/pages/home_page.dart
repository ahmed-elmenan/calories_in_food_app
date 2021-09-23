import 'dart:async';
import 'package:fapp/core/consts/food_categories.dart';
import 'package:fapp/core/widgets/bottom_sheet_sub_title.dart';
import 'package:fapp/features/home/presentation/consts/privacy_policyText.dart';
import 'package:fapp/features/home/presentation/pages/privacy_policy.dart';
import 'package:fapp/features/home/presentation/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/widgets/shareButton.dart';
import 'package:fapp/features/ads/data/datasources/adsRemoteDataSource.dart';
import 'package:fapp/features/ads/data/models/adsInfoModel.dart';
import 'package:fapp/features/ads/data/utils/ads_global_utils.dart';
import 'package:fapp/features/home/presentation/pages/page_details.dart';
import 'package:fapp/features/home/presentation/pages/questionPage.dart';
import 'package:fapp/features/home/presentation/widgets/food_card.dart';
import 'package:fapp/features/home/presentation/widgets/home_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'contact_us.dart';

class FoodCaloriesApp extends StatefulWidget {
  static Map<String, Map<String, List<AdsInfoModel>>> adsData;

  @override
  _FoodCaloriesAppState createState() => _FoodCaloriesAppState();
  static _FoodCaloriesAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_FoodCaloriesAppState>();
}

class _FoodCaloriesAppState extends State<FoodCaloriesApp> {
  getAdsData() async {
    IAdsRemoteDataSource iAdsRemoteDataSource = IAdsRemoteDataSource();

    FoodCaloriesApp.adsData = await iAdsRemoteDataSource.getAdsInfo();
  }

  void updateState() {
    setState(() {});
  }

  BannerAd banner;

  bool showAd = true;
  Timer timer;
  showAdState(bool val) {
    try {
      if (mounted) {
        print("baraaaaaaaaa ++++++Z");
        setState(() {
          showAd = val;
          if (showAd == false) {
            print(showAd);
            timer = Timer.periodic(
                Duration(minutes: 1), (Timer t) => banner.load());
          }
        });
      }
    } catch (e) {
      print("daaaaaaaakhl ++++++Z" + e.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++DISPOSED+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    banner.dispose();
    if (timer != null && timer.isActive) timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    banner = BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(onAdLoaded: (Ad ad) async {
          // print("==AD ID=>" + ad.responseInfo.responseId);
          // if (await AdsGlobalUtils.isAdDisplayable(
          //     ad.responseInfo.responseId, 'banner')) {
          //   print(
          //       "BANNER HAS BEEN APPROVED =====================================================");
          //   showAdState(true);
          // } else {
          //  ²1ad.dispose();
          //   showAdState(false);
          //   print(
          //       " HOME BANNER NOT APPROVED =====================================================");
          // }
        }));
    banner.load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 220,
                child: DrawerHeader(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                        GlobalTheme.lightOrange,
                        GlobalTheme.shadeOrange
                      ])),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/images/logo.svg",
                        height: 80,
                      ),
                      SizedBox(height: 10),
                      Text(NAMEOFAPP,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GrechenFuemen-Regular")),
                      SizedBox(height: 6),
                      Text("It's Never Too Late To Get Fit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "greycliff-cf-regular"))
                    ],
                  ),
                ),
              ),
              DrawerItem(
                title: "QuestionPage",
                iconData: FontAwesomeIcons.userCog,
                redirectWidget: quetionPage(),
              ),
              BottomSheetSubTitle(
                subTitle: "",
              ),
              DrawerItem(
                title: "Privacy policy",
                iconData: FontAwesomeIcons.userShield,
                redirectWidget: privacyPolicy(),
              ),
              BottomSheetSubTitle(
                subTitle: "",
              ),
              DrawerItem(
                title: "Contact Us",
                iconData: FontAwesomeIcons.solidEnvelope,
                redirectWidget: contactUs(),
              ),
              BottomSheetSubTitle(
                subTitle: "",
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Center(
                    child: Text(NAMEOFAPP,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "greycliff-cf-regular")),
                  ),
                  actions: <Widget>[ShareButton()],
                  leading: Builder(builder: (BuildContext context) {
                    return IconButton(
                      icon: FaIcon(FontAwesomeIcons.hamburger),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  }),
                  expandedHeight: 350.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  elevation: 50,
                  backgroundColor: GlobalTheme.lightOrange,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: HomeHeader(),
                  ),
                ),
                new SliverList(
                    delegate: new SliverChildListDelegate(
                        _buildList(FOOD_CATEGORIES.length))),
              ],
            ),
            Positioned(
              bottom: 3,
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: /* trenary to check if the id exist in the db then take an action*/
                      Visibility(visible: showAd, child: AdWidget(ad: banner))),
            ),
          ],
        ),
      ),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = [];
    for (int i = 0; i < count; i++) {
      listItems.add(InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    page_details(nameCategorie: FOOD_CATEGORIES[i]["name"])),
          );
        },
        child: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: FoodCard(foodCategorie: FOOD_CATEGORIES[i])),
      ));
    }
    return listItems;
  }
}
// 09D093
// 00B892
