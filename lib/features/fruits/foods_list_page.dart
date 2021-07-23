import 'package:flutter/material.dart';

import 'food_card.dart';

class FoodsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  FoodCard(),
                  Divider(
                    thickness: 2,
                  )
                ],
              );
            }),
      ),
    );
  }
}
