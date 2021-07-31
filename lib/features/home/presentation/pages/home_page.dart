import 'package:fapp/core/consts/food_categories.dart';
import 'package:fapp/features/home/presentation/widgets/food_card.dart';
import 'package:fapp/features/home/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';

class SilverAppBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // leadingWidth: 300,
              // leading: Container(
              //   color: Colors.red,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Calories Counter",
              //         // style: TextStyle(fontSize: 19),
              //       )
              //     ],
              //   ),
              // ),
              expandedHeight: 350.0,
              floating: true,
              pinned: true,
              snap: true,
              elevation: 50,
              backgroundColor: Colors.pink,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Container(
                    color: Color(0xFF4BA686),
                    child: HomeHeader(),
                  )),
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
          padding: new EdgeInsets.all(20.0),
          child: FoodCard(foodCategorie: FOOD_CATEGORIES[i])));
    }
    return listItems;
  }
}
