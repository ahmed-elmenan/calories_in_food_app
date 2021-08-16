import 'dart:convert';

import 'package:fapp/core/consts/food_categories.dart';
import 'package:fapp/core/data/viande.dart';
import 'package:fapp/features/home/presentation/widgets/food_card.dart';
import 'package:fapp/features/home/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';

import '../dataobject.dart';

class SilverAppBarExample extends StatefulWidget {
  @override
  _SilverAppBarExampleState createState() => _SilverAppBarExampleState();
}

class _SilverAppBarExampleState extends State<SilverAppBarExample> {
   Future<List<FoodModel>> getData() async {
    return await Future.delayed(Duration(seconds: 2), () {
      List<dynamic> data = jsonDecode(VIANDE);
      List<FoodModel> categorie =
          data.map((data) => FoodModel.fromJson(data)).toList();
      print(categorie[0].carb);
      return categorie;
    });
  }
  
   @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 350.0,
              floating: true,
              pinned: true,
              snap: true,
              elevation: 50,
              backgroundColor: Color(0xFF09D093),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Food App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    )),
                background: HomeHeader(),
              ),
            ),
            new SliverList(
                delegate: new SliverChildListDelegate(
                    _buildList(FOOD_CATEGORIES.length))),
          ],
        ),
      ),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = [];

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(8.0),
          child: FoodCard(foodCategorie: FOOD_CATEGORIES[i])));
    }
    return listItems;
  }
}
// 09D093
// 00B892
