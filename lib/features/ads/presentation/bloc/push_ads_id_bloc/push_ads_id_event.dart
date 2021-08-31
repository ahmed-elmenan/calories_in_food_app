part of 'push_ads_id_bloc.dart';

@freezed
abstract class PushAdsIdEvent with _$PushAdsIdEvent {
  const factory PushAdsIdEvent.started(String responseId) = _Started;
}