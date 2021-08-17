import 'package:fapp/features/home/presentation/widgets/card_details.dart';
import 'package:flutter/material.dart';

class page_details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: AppBar(
        // title: const Text('Sample Code'),
      ),
      body: Center(child: Card_details()),
      backgroundColor: Colors.white,
    );
  }
}
