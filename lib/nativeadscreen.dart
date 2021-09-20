import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class NativeAdScreen extends StatefulWidget {
  @override
  _NativeAdScreenState createState() => _NativeAdScreenState();
}

class _NativeAdScreenState extends State<NativeAdScreen> {
  final _nativeAdController = NativeAdmobController();

  double _nativeAdHeight = 0;

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
  }

  void _onStateChanged(AdLoadState state) {
    switch(state) {
      case AdLoadState.loading:
        setState(() {
          _nativeAdHeight = 0;
        });
        break;
      case AdLoadState.loadCompleted:
        setState(() {
          _nativeAdHeight = 300;
        });
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue,
            height: 40,
            width: 200,
            child: Text("Native Ad will be below this"),
          ),
          Container(
            height: _nativeAdHeight,
            color: Colors.white,
            child: NativeAdmob(
              adUnitID: "ca-app-pub-3940256099942544/2247696110",
              controller: _nativeAdController,
              type: NativeAdmobType.full,
              loading: Center(child: CircularProgressIndicator(),),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 40,
            width: 200,
            child: Text("Native Ad will be above this"),
          ),
        ],
      ),
    );
  }
}
