import 'dart:async';

import 'package:fapp/features/home/presentation/consts/privacy_policyText.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'core/styles/GlobalTheme.dart';
import 'core/utils/manage_user_info.dart';
import 'features/home/presentation/data/models/boxes.dart';
import 'features/home/presentation/data/models/firstpage.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/pages/questionPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(FirstpageAdapter());
  await Hive.openBox<Firstpage>('firstpages');
  final mybox = Boxes.getQuestions();
  Firstpage my_question = mybox.get('key');
  if (my_question == null) {
    my_question = new Firstpage();
    my_question.initialzingDate = DateTime.now();
    my_question.isvisible = false;
    await mybox.put('key', my_question);
  } else
    my_question = mybox.get('key');
  Timer timer = Timer.periodic(
      Duration(seconds: 5), (Timer t) => ManageUserInfo.zerowingMacros());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreenView(
      navigateRoute:
          (my_question.isvisible) ? FoodCaloriesApp() : quetionPage(),
      duration: 2000,
      imageSize: 130,
      imageSrc: "assets/images/logo.png",
      text: NAMEOFAPP,
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontFamily: "greycliff-cf-regular",
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      colors: [Colors.white, Colors.white],
      backgroundColor: GlobalTheme.lightGreen,
    ),
  ));
}
