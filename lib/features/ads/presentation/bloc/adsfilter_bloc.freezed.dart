// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'adsfilter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AdsfilterEventTearOff {
  const _$AdsfilterEventTearOff();

// ignore: unused_element
  _Started started() {
    return const _Started();
  }
}

/// @nodoc
// ignore: unused_element
const $AdsfilterEvent = _$AdsfilterEventTearOff();

/// @nodoc
mixin _$AdsfilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult started(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult started(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult started(_Started value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult started(_Started value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AdsfilterEventCopyWith<$Res> {
  factory $AdsfilterEventCopyWith(
          AdsfilterEvent value, $Res Function(AdsfilterEvent) then) =
      _$AdsfilterEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AdsfilterEventCopyWithImpl<$Res>
    implements $AdsfilterEventCopyWith<$Res> {
  _$AdsfilterEventCopyWithImpl(this._value, this._then);

  final AdsfilterEvent _value;
  // ignore: unused_field
  final $Res Function(AdsfilterEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$AdsfilterEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc
class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AdsfilterEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult started(),
  }) {
    assert(started != null);
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult started(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult started(_Started value),
  }) {
    assert(started != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult started(_Started value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AdsfilterEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
class _$AdsfilterStateTearOff {
  const _$AdsfilterStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _FilterLoading filterLoading() {
    return const _FilterLoading();
  }

// ignore: unused_element
  _FilterSuccess filterSuccess(
      Map<String, List<AdsInfoModel>> adsStatesInfoList) {
    return _FilterSuccess(
      adsStatesInfoList,
    );
  }

// ignore: unused_element
  _FilterFailed filterFailed() {
    return const _FilterFailed();
  }
}

/// @nodoc
// ignore: unused_element
const $AdsfilterState = _$AdsfilterStateTearOff();

/// @nodoc
mixin _$AdsfilterState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult filterLoading(),
    @required
        TResult filterSuccess(
            Map<String, List<AdsInfoModel>> adsStatesInfoList),
    @required TResult filterFailed(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult filterLoading(),
    TResult filterSuccess(Map<String, List<AdsInfoModel>> adsStatesInfoList),
    TResult filterFailed(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult filterLoading(_FilterLoading value),
    @required TResult filterSuccess(_FilterSuccess value),
    @required TResult filterFailed(_FilterFailed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult filterLoading(_FilterLoading value),
    TResult filterSuccess(_FilterSuccess value),
    TResult filterFailed(_FilterFailed value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AdsfilterStateCopyWith<$Res> {
  factory $AdsfilterStateCopyWith(
          AdsfilterState value, $Res Function(AdsfilterState) then) =
      _$AdsfilterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AdsfilterStateCopyWithImpl<$Res>
    implements $AdsfilterStateCopyWith<$Res> {
  _$AdsfilterStateCopyWithImpl(this._value, this._then);

  final AdsfilterState _value;
  // ignore: unused_field
  final $Res Function(AdsfilterState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AdsfilterStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AdsfilterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult filterLoading(),
    @required
        TResult filterSuccess(
            Map<String, List<AdsInfoModel>> adsStatesInfoList),
    @required TResult filterFailed(),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult filterLoading(),
    TResult filterSuccess(Map<String, List<AdsInfoModel>> adsStatesInfoList),
    TResult filterFailed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult filterLoading(_FilterLoading value),
    @required TResult filterSuccess(_FilterSuccess value),
    @required TResult filterFailed(_FilterFailed value),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult filterLoading(_FilterLoading value),
    TResult filterSuccess(_FilterSuccess value),
    TResult filterFailed(_FilterFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AdsfilterState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$FilterLoadingCopyWith<$Res> {
  factory _$FilterLoadingCopyWith(
          _FilterLoading value, $Res Function(_FilterLoading) then) =
      __$FilterLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$FilterLoadingCopyWithImpl<$Res>
    extends _$AdsfilterStateCopyWithImpl<$Res>
    implements _$FilterLoadingCopyWith<$Res> {
  __$FilterLoadingCopyWithImpl(
      _FilterLoading _value, $Res Function(_FilterLoading) _then)
      : super(_value, (v) => _then(v as _FilterLoading));

  @override
  _FilterLoading get _value => super._value as _FilterLoading;
}

/// @nodoc
class _$_FilterLoading implements _FilterLoading {
  const _$_FilterLoading();

  @override
  String toString() {
    return 'AdsfilterState.filterLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FilterLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult filterLoading(),
    @required
        TResult filterSuccess(
            Map<String, List<AdsInfoModel>> adsStatesInfoList),
    @required TResult filterFailed(),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return filterLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult filterLoading(),
    TResult filterSuccess(Map<String, List<AdsInfoModel>> adsStatesInfoList),
    TResult filterFailed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filterLoading != null) {
      return filterLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult filterLoading(_FilterLoading value),
    @required TResult filterSuccess(_FilterSuccess value),
    @required TResult filterFailed(_FilterFailed value),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return filterLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult filterLoading(_FilterLoading value),
    TResult filterSuccess(_FilterSuccess value),
    TResult filterFailed(_FilterFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filterLoading != null) {
      return filterLoading(this);
    }
    return orElse();
  }
}

abstract class _FilterLoading implements AdsfilterState {
  const factory _FilterLoading() = _$_FilterLoading;
}

/// @nodoc
abstract class _$FilterSuccessCopyWith<$Res> {
  factory _$FilterSuccessCopyWith(
          _FilterSuccess value, $Res Function(_FilterSuccess) then) =
      __$FilterSuccessCopyWithImpl<$Res>;
  $Res call({Map<String, List<AdsInfoModel>> adsStatesInfoList});
}

/// @nodoc
class __$FilterSuccessCopyWithImpl<$Res>
    extends _$AdsfilterStateCopyWithImpl<$Res>
    implements _$FilterSuccessCopyWith<$Res> {
  __$FilterSuccessCopyWithImpl(
      _FilterSuccess _value, $Res Function(_FilterSuccess) _then)
      : super(_value, (v) => _then(v as _FilterSuccess));

  @override
  _FilterSuccess get _value => super._value as _FilterSuccess;

  @override
  $Res call({
    Object adsStatesInfoList = freezed,
  }) {
    return _then(_FilterSuccess(
      adsStatesInfoList == freezed
          ? _value.adsStatesInfoList
          : adsStatesInfoList as Map<String, List<AdsInfoModel>>,
    ));
  }
}

/// @nodoc
class _$_FilterSuccess implements _FilterSuccess {
  const _$_FilterSuccess(this.adsStatesInfoList)
      : assert(adsStatesInfoList != null);

  @override
  final Map<String, List<AdsInfoModel>> adsStatesInfoList;

  @override
  String toString() {
    return 'AdsfilterState.filterSuccess(adsStatesInfoList: $adsStatesInfoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FilterSuccess &&
            (identical(other.adsStatesInfoList, adsStatesInfoList) ||
                const DeepCollectionEquality()
                    .equals(other.adsStatesInfoList, adsStatesInfoList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(adsStatesInfoList);

  @JsonKey(ignore: true)
  @override
  _$FilterSuccessCopyWith<_FilterSuccess> get copyWith =>
      __$FilterSuccessCopyWithImpl<_FilterSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult filterLoading(),
    @required
        TResult filterSuccess(
            Map<String, List<AdsInfoModel>> adsStatesInfoList),
    @required TResult filterFailed(),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return filterSuccess(adsStatesInfoList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult filterLoading(),
    TResult filterSuccess(Map<String, List<AdsInfoModel>> adsStatesInfoList),
    TResult filterFailed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filterSuccess != null) {
      return filterSuccess(adsStatesInfoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult filterLoading(_FilterLoading value),
    @required TResult filterSuccess(_FilterSuccess value),
    @required TResult filterFailed(_FilterFailed value),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return filterSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult filterLoading(_FilterLoading value),
    TResult filterSuccess(_FilterSuccess value),
    TResult filterFailed(_FilterFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filterSuccess != null) {
      return filterSuccess(this);
    }
    return orElse();
  }
}

abstract class _FilterSuccess implements AdsfilterState {
  const factory _FilterSuccess(
      Map<String, List<AdsInfoModel>> adsStatesInfoList) = _$_FilterSuccess;

  Map<String, List<AdsInfoModel>> get adsStatesInfoList;
  @JsonKey(ignore: true)
  _$FilterSuccessCopyWith<_FilterSuccess> get copyWith;
}

/// @nodoc
abstract class _$FilterFailedCopyWith<$Res> {
  factory _$FilterFailedCopyWith(
          _FilterFailed value, $Res Function(_FilterFailed) then) =
      __$FilterFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$FilterFailedCopyWithImpl<$Res>
    extends _$AdsfilterStateCopyWithImpl<$Res>
    implements _$FilterFailedCopyWith<$Res> {
  __$FilterFailedCopyWithImpl(
      _FilterFailed _value, $Res Function(_FilterFailed) _then)
      : super(_value, (v) => _then(v as _FilterFailed));

  @override
  _FilterFailed get _value => super._value as _FilterFailed;
}

/// @nodoc
class _$_FilterFailed implements _FilterFailed {
  const _$_FilterFailed();

  @override
  String toString() {
    return 'AdsfilterState.filterFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FilterFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult filterLoading(),
    @required
        TResult filterSuccess(
            Map<String, List<AdsInfoModel>> adsStatesInfoList),
    @required TResult filterFailed(),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return filterFailed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult filterLoading(),
    TResult filterSuccess(Map<String, List<AdsInfoModel>> adsStatesInfoList),
    TResult filterFailed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filterFailed != null) {
      return filterFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult filterLoading(_FilterLoading value),
    @required TResult filterSuccess(_FilterSuccess value),
    @required TResult filterFailed(_FilterFailed value),
  }) {
    assert(initial != null);
    assert(filterLoading != null);
    assert(filterSuccess != null);
    assert(filterFailed != null);
    return filterFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult filterLoading(_FilterLoading value),
    TResult filterSuccess(_FilterSuccess value),
    TResult filterFailed(_FilterFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (filterFailed != null) {
      return filterFailed(this);
    }
    return orElse();
  }
}

abstract class _FilterFailed implements AdsfilterState {
  const factory _FilterFailed() = _$_FilterFailed;
}
