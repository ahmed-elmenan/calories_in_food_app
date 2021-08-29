import 'package:fapp/features/home/presentation/pages/page_details.dart';
import 'package:flutter/material.dart';
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
        height: size.height / 7 - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => page_details(nameCategorie : this.foodCategorie["name"])));
          },
          child: Row(
            children: [
              Container(
                  height: double.infinity,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        AssetImage(this.foodCategorie["imagePath"]),
                    backgroundColor: Colors.transparent,
                  )),
              SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Text(
                  this.foodCategorie["name"],
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF818182),
                      fontWeight: FontWeight.bold),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Color(0xFF818182),
                size: 16,
              ),
            ],
          ),
        )
      );
  }
}
