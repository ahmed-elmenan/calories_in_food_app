part of 'get_ads_info_data_bloc.dart';

@freezed
abstract class GetAdsInfoDataState with _$GetAdsInfoDataState {
  const factory GetAdsInfoDataState.initial() = _Initial;
  const factory GetAdsInfoDataState.getAdsInfoDataLoading() = _GetAdsInfoDataLoading;
  const factory GetAdsInfoDataState.getAdsInfoDataSuccess( Map<String,  Map<String, List<AdsInfoModel>>> adsStatesInfoList) = _GetAdsInfoDataSuccess;
  const factory GetAdsInfoDataState.getAdsInfoDataFailed() = _GetAdsInfoDataFailed;
}
