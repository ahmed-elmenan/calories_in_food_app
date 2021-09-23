import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/features/home/presentation/pages/page_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodCard extends StatelessWidget {
  Map<String, dynamic> foodCategorie;

  FoodCard({this.foodCategorie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              this.foodCategorie["imagePath"],
              height: 60,
              width: 60,
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 3,
              child: Text(
                this.foodCategorie["name"],
                style: TextStyle(
                    fontSize: 19,
                    color: GlobalTheme.customedBlack,
                    fontWeight: FontWeight.bold,
                    fontFamily: "greycliff-cf-regular"),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      "assets/images/icons/right-chevron.svg",
                      color: GlobalTheme.lightGreen,
                      height: 40,
                    )),
              ),
            ),
          ],
        ));
  }
}
