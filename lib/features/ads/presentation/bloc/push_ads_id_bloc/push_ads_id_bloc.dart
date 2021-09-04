import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_ads_id_event.dart';
part 'push_ads_id_state.dart';
part 'push_ads_id_bloc.freezed.dart';

class PushAdsIdBloc extends Bloc<PushAdsIdEvent, PushAdsIdState> {
  PushAdsIdBloc() : super(_Initial());

  @override
  Stream<PushAdsIdState> mapEventToState(
    PushAdsIdEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
