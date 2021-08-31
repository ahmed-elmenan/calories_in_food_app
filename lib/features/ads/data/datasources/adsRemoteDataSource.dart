import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fapp/features/ads/data/models/adsInfoModel.dart';

abstract class AdsRemoteDataSource {
  Future<Map<String, List<AdsInfoModel>>> getAdsInfo();
}

class IAdsRemoteDataSource implements AdsRemoteDataSource {
  String ON_HOLD_ADs = "OnHoldAds";
  String APPROVED_ADs = "approvedAds";
  String FORBIDDEN_ADs = "ForbiddenAds";
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Map<String, List<AdsInfoModel>> adsStatesInfo = {};

  @override
  Future<Map<String, List<AdsInfoModel>>> getAdsInfo() async {
    try {
      adsStatesInfo[APPROVED_ADs] = [];
      await _fireStore.collection(APPROVED_ADs).get().then((doc) {
        doc.docs.forEach((DocumentSnapshot doc) {
          adsStatesInfo[APPROVED_ADs].add(AdsInfoModel.fromSnapshot(doc));
        });
      });

      adsStatesInfo[ON_HOLD_ADs] = [];
      await _fireStore.collection(ON_HOLD_ADs).get().then((doc) {
        doc.docs.forEach((DocumentSnapshot doc) {
          adsStatesInfo[ON_HOLD_ADs].add(AdsInfoModel.fromSnapshot(doc));
        });
      });

      adsStatesInfo[FORBIDDEN_ADs] = [];
      await _fireStore.collection(FORBIDDEN_ADs).get().then((doc) {
        doc.docs.forEach((DocumentSnapshot doc) {
          adsStatesInfo[FORBIDDEN_ADs].add(AdsInfoModel.fromSnapshot(doc));
        });
      });
    } catch (e) {
      print("=ERROR=>" + e.toString());
    }
    return adsStatesInfo;
  }
}
