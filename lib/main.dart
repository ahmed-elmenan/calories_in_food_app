import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FoodCaloriesApp(),
  ));
}


// class TestDate extends StatelessWidget {
//   checkDAte() {
//     DateTime date = DateTime.now();
//     DateTime date2 = date.add(Duration(hours: 24)); 
//     print("==>" + date.difference(date2).toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     checkDAte();
//     return Scaffold(
//       body: Container(
//         color: Colors.blue,
//       ),
//     );
//   }
// }
