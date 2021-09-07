import 'package:fapp/features/ads/data/datasources/adsRemoteDataSource.dart';
import 'package:fapp/features/ads/data/models/adsInfoModel.dart';
import 'package:fapp/features/home/presentation/pages/home_page.dart';

class GlobalUtils {
  static bool isDataExist(String value, List<AdsInfoModel> adsIdList) {
    var data = adsIdList.where((item) => (item.responseId == value));
    print("len = " + data.length.toString());
    return data.length >= 1 ? true : false;
  }

  static Future<bool> isAdDisplayable(String responseId, String adType) async {
    
    if (GlobalUtils.isDataExist(
        responseId, FoodCaloriesApp.adsData['approvedAds'][adType])) {
      return true;
    } else if (GlobalUtils.isDataExist(
        responseId, FoodCaloriesApp.adsData['ForbiddenAds'][adType])) {
      return false;
    } else {
      try {
        IAdsRemoteDataSource iAdsRemoteDataSource = IAdsRemoteDataSource();
        await iAdsRemoteDataSource.pushAdsIdToOnHold(
            AdsInfoModel(responseId: responseId, adType: adType));
      } catch (e) {
        print("PUSH TO HOLD ERROR = " + e.toString());
      }
    }

    return false;
  }
}
