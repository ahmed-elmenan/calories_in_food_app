part of 'push_ads_id_bloc.dart';

@freezed
abstract class PushAdsIdState with _$PushAdsIdState {
  const factory PushAdsIdState.initial() = _Initial;
  const factory PushAdsIdState.pushAdsIdLoading() = _PushAdsIdLoading;
  const factory PushAdsIdState.pushAdsIdSuccess() = _PushAdsIdSuccess;
  const factory PushAdsIdState.pushAdsIdFailed() = _PushAdsIdFailed;
}
