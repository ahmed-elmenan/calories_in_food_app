part of 'adsfilter_bloc.dart';


@freezed
abstract class AdsfilterState with _$AdsfilterState {
const factory AdsfilterState.initial() = _Initial;
  const factory AdsfilterState.filterLoading() = _FilterLoading;
  const factory AdsfilterState.filterSuccess( Map<String, List<AdsInfoModel>> adsStatesInfoList) = _FilterSuccess;
  const factory AdsfilterState.filterFailed() = _FilterFailed;
}


