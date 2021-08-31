part of 'adsfilter_bloc.dart';

@freezed
abstract class AdsfilterEvent with _$AdsfilterEvent {
  const factory AdsfilterEvent.started() = _Started;
}
