import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fapp/features/home/presentation/pages/home_page.dart';

class GlobalUtils {
  static Future<bool> backToTheHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FoodCaloriesApp()),
    );
    return Future.value(true);
  }
}
