import 'dart:async';

import 'package:fapp/core/consts/food_categories.dart';
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
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_native_admob/native_admob_options.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
    _subscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);

    banner = BannerAd(
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
                " HOME BANNER NOT APPROVED =====================================================");
          }
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
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white38,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/apple_home_logo.svg",
                      height: 100,
                    ),
                    Text("atduyuyfiytytdtudutdutdfaf"),
                    Text("data")
                  ],
                ),
              ),
              DrawerItem(
                title: "QuestionPage",
                iconData: Icons.accessibility_new,
                redirectWidget: quetionPage(),
              ),
              DrawerItem(
                title: "Privacy policy",
                iconData: FontAwesomeIcons.userShield,
                redirectWidget: quetionPage(),
              ),
              DrawerItem(
                title: "Contact Us",
                iconData: FontAwesomeIcons.mailchimp,
                redirectWidget: quetionPage(),
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
                    child: Text('Food Calories Calculator',
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
      if (i % 5 == 0 && i != 0) {
        listItems.add(myNativeAd());
      } else {
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
    }
    return listItems;
  }

  final _nativeAdController = NativeAdmobController();

  double _nativeAdHeight = 0;

  StreamSubscription _subscription;

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _nativeAdHeight = 0;
        });
        break;
      case AdLoadState.loadCompleted:
        setState(() {
          _nativeAdHeight = 100;
        });
        break;
      default:
        break;
    }
    print(state);
  }

  Widget myNativeAd() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(vertical: 5),
        height: _nativeAdHeight,
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
        child: NativeAdmob(
          adUnitID: "ca-app-pub-3940256099942544/2247696110",
          controller: _nativeAdController,
          type: NativeAdmobType.banner,
          // numberAds: 3,
          loading: Center(
            child: CircularProgressIndicator(),
          ),
          options: NativeAdmobOptions(
              headlineTextStyle: NativeTextStyle(
                fontSize: 16,
                color: GlobalTheme.customedBlack,
              ),
              showMediaContent: true),
        ),
      ),
    );
  }
}
// 09D093
// 00B892
