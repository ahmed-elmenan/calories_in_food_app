import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/widgets/shareButton.dart';
import 'package:fapp/features/home/presentation/consts/privacy_policyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class contactUs extends StatelessWidget {
  const contactUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headertextStyle = TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "greycliff-cf-regular");
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                ShareButton(),
              ],
              title: Center(
                child: Text('Contact Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "greycliff-cf-regular")),
              ),
              leading: new IconButton(
                  icon: new Icon(Icons.chevron_left),
                  onPressed: () => Navigator.pop((context))),
              backgroundColor: GlobalTheme.lightOrange,
            ),
            body: Container(
                color: Colors.white38,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: ListView(
                  children: [
                    Text("Contact Us",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "greycliff-cf-regular")),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Feel Free To Drop Us a Message",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "greycliff-cf-regular")),
                    SizedBox(
                      height: 150,
                    ),
                    Row(
                      children: [
                        Icon(Icons.mail),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Food.calories.calculator@gmail.com",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontFamily: "greycliff-cf-regular")),
                      ],
                    ),
                  ],
                ))));
  }
}
