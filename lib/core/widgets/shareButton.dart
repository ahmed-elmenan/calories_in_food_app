import 'package:flutter/material.dart';
import 'package:share/share.dart';

Widget ShareButton() {
  return IconButton(
    icon: const Icon(Icons.share),
    tooltip: 'Show Snackbar',
    onPressed: () {
      Share.share('check out my website https://facebook.com',
          subject: 'Look what I made!');
    },
  );
}
