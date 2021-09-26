import 'package:flutter/material.dart';
import 'package:share/share.dart';

Widget ShareButton() {
  return IconButton(
    icon: const Icon(Icons.share),
    tooltip: 'Show Snackbar',
    onPressed: () {
      Share.share('Check out the Food Calories Calculator app on playstore https://play.google.com/store/apps/details?id=com.calories.food',
          subject: 'Check it out!');
    },
  );
}
