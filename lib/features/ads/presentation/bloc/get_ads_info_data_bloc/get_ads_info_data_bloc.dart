// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:fapp/features/ads/data/datasources/adsRemoteDataSource.dart';
// import 'package:fapp/features/ads/data/models/adsInfoModel.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'get_ads_info_data_event.dart';
// part 'get_ads_info_data_state.dart';
// part 'get_ads_info_data_bloc.freezed.dart';

// class GetAdsInfoDataBloc
//     extends Bloc<GetAdsInfoDataEvent, GetAdsInfoDataState> {
//   IAdsRemoteDataSource adsRemoteDataSource;

//   GetAdsInfoDataBloc() : super(_Initial());

//   @override
//   Stream<GetAdsInfoDataState> mapEventToState(
//     GetAdsInfoDataEvent event,
//   ) async* {
//     if (event is _Started) {
//       try {
//         Map<String,  Map<String, List<AdsInfoModel>>> adsStatesInfoList;

//         yield _GetAdsInfoDataLoading();
//         adsStatesInfoList = await adsRemoteDataSource.getAdsInfo();
//         yield GetAdsInfoDataState.getAdsInfoDataSuccess(adsStatesInfoList);
//       } catch (e) {
//         yield GetAdsInfoDataState.getAdsInfoDataFailed();
//       }
//     }
//   }
// }
