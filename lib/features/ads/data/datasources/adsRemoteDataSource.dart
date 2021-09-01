import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fapp/features/ads/data/models/adsInfoModel.dart';

abstract class AdsRemoteDataSource {
  Future<Map<String,  Map<String, List<AdsInfoModel>>>> getAdsInfo();
  Future<bool> pushAdsIdToOnHold(AdsInfoModel adsInfoModel);
}

class IAdsRemoteDataSource implements AdsRemoteDataSource {
  String ON_HOLD_ADs = "OnHoldAds";
  String APPROVED_ADs = "approvedAds";
  String FORBIDDEN_ADs = "ForbiddenAds";
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Map<String,  Map<String, List<AdsInfoModel>>> adsStatesInfo = {};


    Future getAdsInfoPerCollection(String collection) async {
      adsStatesInfo[collection]["banner"] = [];
      await _fireStore.collection(collection).get().then((doc) {
        doc.docs.forEach((DocumentSnapshot doc) {
          if (doc.get("banner"))
            adsStatesInfo[collection]["banner"].add(AdsInfoModel.fromSnapshot(doc));
          else if (doc.get("interstitial"))
            adsStatesInfo[collection]["interstitial"].add(AdsInfoModel.fromSnapshot(doc));
        });
      });
    }


  @override
  Future<Map<String,  Map<String, List<AdsInfoModel>>>> getAdsInfo() async {
    try {
        await getAdsInfoPerCollection(APPROVED_ADs);
        await getAdsInfoPerCollection(ON_HOLD_ADs);
        await getAdsInfoPerCollection(FORBIDDEN_ADs);
    } catch (e) {
        print("=GET ERROR=>" + e.toString());
    }  

    for(int i =0; i < adsStatesInfo[ON_HOLD_ADs].length; i++) {
      print("ban ==>" + adsStatesInfo[ON_HOLD_ADs]["banner"][i].responseId);
    } 
    
    return adsStatesInfo;
  }

  @override
  Future<bool> pushAdsIdToOnHold(AdsInfoModel adsInfoModel) async {
    try {
      await _fireStore.collection("OnHoldAds").doc(adsInfoModel.responseId).set({
        "ResponseId": adsInfoModel.responseId,
        "AdType": adsInfoModel.adType
      });
      return  true;
    } catch (e) {
      print("=PUSH ERROR=>" + e.toString());
    }
      return false;
  }
}
