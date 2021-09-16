import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:flutter/material.dart';

class BottomSheetSubTitle extends StatelessWidget {
  String subTitle;

  BottomSheetSubTitle({this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            this.subTitle,
            style: TextStyle(color: GlobalTheme.secondaryGrey),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
              height: 2,
              // width: MediaQuery.of(context).size.width - 130,
              color: GlobalTheme.secondaryGrey,
              // child: Text("a"),
            ),
          )
        ],
      ),
    );
  }
}
