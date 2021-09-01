import 'package:cloud_firestore/cloud_firestore.dart';

class AdsInfoModel {
  static const RESPONSE_ID = "ResponseId";
  static const AD_TYPE = "AdType";

  String responseId;
  String adType;

  AdsInfoModel({this.responseId, this.adType});

  AdsInfoModel.fromSnapshot(DocumentSnapshot snapshot) {
    responseId = snapshot.get(RESPONSE_ID);
    adType = snapshot.get(AD_TYPE);
  }
}
