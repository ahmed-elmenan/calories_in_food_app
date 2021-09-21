import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/utils/global_utils.dart';
import 'package:fapp/core/widgets/shareButton.dart';
import 'package:fapp/features/home/presentation/consts/privacy_policyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class privacyPolicy extends StatelessWidget {
  const privacyPolicy({Key key}) : super(key: key);

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
                child: Text('Privacy Policy',
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
                    Text(PRIVACY_POLICYTEXT,
                        style: headertextStyle, textAlign: TextAlign.center),
                  ],
                ))));
  }
}
