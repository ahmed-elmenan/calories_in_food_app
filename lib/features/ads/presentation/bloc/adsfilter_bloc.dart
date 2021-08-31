import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fapp/features/ads/data/datasources/adsRemoteDataSource.dart';
import 'package:fapp/features/ads/data/models/adsInfoModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'adsfilter_event.dart';
part 'adsfilter_state.dart';
part 'adsfilter_bloc.freezed.dart';

class AdsFilterBloc extends Bloc<AdsfilterEvent, AdsfilterState> {
  IAdsRemoteDataSource adsRemoteDataSource;

  AdsFilterBloc() : super(AdsfilterState.initial()) {
    adsRemoteDataSource = IAdsRemoteDataSource();
  }

  @override
  Stream<AdsfilterState> mapEventToState(
    AdsfilterEvent event,
  ) async* {
    Map<String, List<AdsInfoModel>> adsStatesInfoList;
    if (event is _Started) {
      try {
        yield _FilterLoading();
        adsStatesInfoList = await adsRemoteDataSource.getAdsInfo();
        yield _FilterSuccess(adsStatesInfoList);
      } catch (e) {
        yield  _FilterFailed();
      }
    }
  }
}
