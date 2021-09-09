import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fapp/features/ads/data/models/adsInfoModel.dart';

abstract class AdsRemoteDataSource {
  Future<Map<String, Map<String, List<AdsInfoModel>>>> getAdsInfo();
  Future<bool> pushAdsIdToOnHold(AdsInfoModel adsInfoModel);
}

class IAdsRemoteDataSource implements AdsRemoteDataSource {
  String ON_HOLD_ADs = "OnHoldAds";
  String APPROVED_ADs = "ApprovedAds";
  String FORBIDDEN_ADs = "ForbiddenAds";
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Map<String, Map<String, List<AdsInfoModel>>> adsStatesInfo = {};

  Future getAdsInfoPerCollection(String collection) async {
    adsStatesInfo[collection] = {};
    adsStatesInfo[collection]["banner"] = [];
    adsStatesInfo[collection]["interstitial"] = [];
    await _fireStore.collection(collection).get().then((doc) {
      doc.docs.forEach((DocumentSnapshot doc) {
        if (doc.get("AdType") == "banner")
          adsStatesInfo[collection]["banner"]
              .add(AdsInfoModel.fromSnapshot(doc));
        else if (doc.get("AdType") == "interstitial")
          adsStatesInfo[collection]["interstitial"]
              .add(AdsInfoModel.fromSnapshot(doc));
      });
    });
  }

  @override
  Future<Map<String, Map<String, List<AdsInfoModel>>>> getAdsInfo() async {
    try {
      await getAdsInfoPerCollection(APPROVED_ADs);
      await getAdsInfoPerCollection(ON_HOLD_ADs);
      await getAdsInfoPerCollection(FORBIDDEN_ADs);
    } catch (e) {
      print("=GET ERROR=>" + e.toString());
    }

    print("====+" + adsStatesInfo[APPROVED_ADs]["interstitial"].length.toString());
    for (int i = 0; i < adsStatesInfo[APPROVED_ADs]["interstitial"].length; i++) {
      print("ban ==>" + adsStatesInfo[APPROVED_ADs]["interstitial"][i].responseId);
    }

    return adsStatesInfo;
  }

  @override
  Future<bool> pushAdsIdToOnHold(AdsInfoModel adsInfoModel) async {
    try {
      await _fireStore
          .collection("OnHoldAds")
          .doc(adsInfoModel.responseId)
          .set({
        "ResponseId": adsInfoModel.responseId,
        "AdType": adsInfoModel.adType
      });
      return true;
    } catch (e) {
      print("=PUSH ERROR=>" + e.toString());
    }
    return false;
  }

  getAdsTypeDataInfoPerCollection(String collection, String adType) async {
    this.adsStatesInfo[collection] = {};
    this.adsStatesInfo[collection][adType] = [];

    await _fireStore
        .collection(collection)
        .where('AdType', isEqualTo: adType)
        .get()
        .then((value) {
      value.docs.forEach((doc) {
        print("dddoooooccc => " + doc.data()['AdType']);
        adsStatesInfo[collection][adType].add(AdsInfoModel.fromSnapshot(doc));
      });
    });
  }

  @override
  Future<bool> gethAdsDataByAdsType(String adType) async {
    try {
      await getAdsTypeDataInfoPerCollection(APPROVED_ADs, adType);
      await getAdsTypeDataInfoPerCollection(ON_HOLD_ADs, adType);
      await getAdsTypeDataInfoPerCollection(FORBIDDEN_ADs, adType);
      return true;
    } catch (e) {
      print("=GET PER ADTYPE ERROR=>" + e.toString());
    }

    print("====+" + adsStatesInfo[APPROVED_ADs][adType].length.toString());
    for (int i = 0; i < adsStatesInfo[APPROVED_ADs][adType].length; i++) {
      print("adType ==>" + adsStatesInfo[APPROVED_ADs][adType][i].responseId);
    }

    return false;
  }  
}
