import 'package:cloud_firestore/cloud_firestore.dart';

class AdsInfoModel {
  static const RESPONSE_ID = "ResponseId";

  String responseId;

  AdsInfoModel({this.responseId});

  AdsInfoModel.fromSnapshot(DocumentSnapshot snapshot) {
    responseId = snapshot.get(RESPONSE_ID);
  }
}
