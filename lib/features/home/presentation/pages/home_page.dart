import 'package:fapp/core/consts/food_categories.dart';
import 'package:fapp/features/home/presentation/widgets/food_card.dart';
import 'package:fapp/features/home/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';

class FoodCaloriesApp extends StatefulWidget {
  @override
  _FoodCaloriesAppState createState() => _FoodCaloriesAppState();
}

class _FoodCaloriesAppState extends State<FoodCaloriesApp> {
  
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
