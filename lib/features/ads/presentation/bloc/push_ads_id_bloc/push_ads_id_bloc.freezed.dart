// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'push_ads_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PushAdsIdEventTearOff {
  const _$PushAdsIdEventTearOff();

// ignore: unused_element
  _Started started(String responseId) {
    return _Started(
      responseId,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PushAdsIdEvent = _$PushAdsIdEventTearOff();

/// @nodoc
mixin _$PushAdsIdEvent {
  String get responseId;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult started(String responseId),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult started(String responseId),
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

  @JsonKey(ignore: true)
  $PushAdsIdEventCopyWith<PushAdsIdEvent> get copyWith;
}

/// @nodoc
abstract class $PushAdsIdEventCopyWith<$Res> {
  factory $PushAdsIdEventCopyWith(
          PushAdsIdEvent value, $Res Function(PushAdsIdEvent) then) =
      _$PushAdsIdEventCopyWithImpl<$Res>;
  $Res call({String responseId});
}

/// @nodoc
class _$PushAdsIdEventCopyWithImpl<$Res>
    implements $PushAdsIdEventCopyWith<$Res> {
  _$PushAdsIdEventCopyWithImpl(this._value, this._then);

  final PushAdsIdEvent _value;
  // ignore: unused_field
  final $Res Function(PushAdsIdEvent) _then;

  @override
  $Res call({
    Object responseId = freezed,
  }) {
    return _then(_value.copyWith(
      responseId:
          responseId == freezed ? _value.responseId : responseId as String,
    ));
  }
}

/// @nodoc
abstract class _$StartedCopyWith<$Res>
    implements $PushAdsIdEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  @override
  $Res call({String responseId});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$PushAdsIdEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object responseId = freezed,
  }) {
    return _then(_Started(
      responseId == freezed ? _value.responseId : responseId as String,
    ));
  }
}

/// @nodoc
class _$_Started implements _Started {
  const _$_Started(this.responseId) : assert(responseId != null);

  @override
  final String responseId;

  @override
  String toString() {
    return 'PushAdsIdEvent.started(responseId: $responseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Started &&
            (identical(other.responseId, responseId) ||
                const DeepCollectionEquality()
                    .equals(other.responseId, responseId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(responseId);

  @JsonKey(ignore: true)
  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult started(String responseId),
  }) {
    assert(started != null);
    return started(responseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult started(String responseId),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(responseId);
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

abstract class _Started implements PushAdsIdEvent {
  const factory _Started(String responseId) = _$_Started;

  @override
  String get responseId;
  @override
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith;
}

/// @nodoc
class _$PushAdsIdStateTearOff {
  const _$PushAdsIdStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _PushAdsIdLoading pushAdsIdLoading() {
    return const _PushAdsIdLoading();
  }

// ignore: unused_element
  _PushAdsIdSuccess pushAdsIdSuccess() {
    return const _PushAdsIdSuccess();
  }

// ignore: unused_element
  _PushAdsIdFailed pushAdsIdFailed() {
    return const _PushAdsIdFailed();
  }
}

/// @nodoc
// ignore: unused_element
const $PushAdsIdState = _$PushAdsIdStateTearOff();

/// @nodoc
mixin _$PushAdsIdState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult pushAdsIdLoading(),
    @required TResult pushAdsIdSuccess(),
    @required TResult pushAdsIdFailed(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult pushAdsIdLoading(),
    TResult pushAdsIdSuccess(),
    TResult pushAdsIdFailed(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult pushAdsIdLoading(_PushAdsIdLoading value),
    @required TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    @required TResult pushAdsIdFailed(_PushAdsIdFailed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult pushAdsIdLoading(_PushAdsIdLoading value),
    TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    TResult pushAdsIdFailed(_PushAdsIdFailed value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $PushAdsIdStateCopyWith<$Res> {
  factory $PushAdsIdStateCopyWith(
          PushAdsIdState value, $Res Function(PushAdsIdState) then) =
      _$PushAdsIdStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PushAdsIdStateCopyWithImpl<$Res>
    implements $PushAdsIdStateCopyWith<$Res> {
  _$PushAdsIdStateCopyWithImpl(this._value, this._then);

  final PushAdsIdState _value;
  // ignore: unused_field
  final $Res Function(PushAdsIdState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$PushAdsIdStateCopyWithImpl<$Res>
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
    return 'PushAdsIdState.initial()';
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
    @required TResult pushAdsIdLoading(),
    @required TResult pushAdsIdSuccess(),
    @required TResult pushAdsIdFailed(),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult pushAdsIdLoading(),
    TResult pushAdsIdSuccess(),
    TResult pushAdsIdFailed(),
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
    @required TResult pushAdsIdLoading(_PushAdsIdLoading value),
    @required TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    @required TResult pushAdsIdFailed(_PushAdsIdFailed value),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult pushAdsIdLoading(_PushAdsIdLoading value),
    TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    TResult pushAdsIdFailed(_PushAdsIdFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PushAdsIdState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$PushAdsIdLoadingCopyWith<$Res> {
  factory _$PushAdsIdLoadingCopyWith(
          _PushAdsIdLoading value, $Res Function(_PushAdsIdLoading) then) =
      __$PushAdsIdLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$PushAdsIdLoadingCopyWithImpl<$Res>
    extends _$PushAdsIdStateCopyWithImpl<$Res>
    implements _$PushAdsIdLoadingCopyWith<$Res> {
  __$PushAdsIdLoadingCopyWithImpl(
      _PushAdsIdLoading _value, $Res Function(_PushAdsIdLoading) _then)
      : super(_value, (v) => _then(v as _PushAdsIdLoading));

  @override
  _PushAdsIdLoading get _value => super._value as _PushAdsIdLoading;
}

/// @nodoc
class _$_PushAdsIdLoading implements _PushAdsIdLoading {
  const _$_PushAdsIdLoading();

  @override
  String toString() {
    return 'PushAdsIdState.pushAdsIdLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PushAdsIdLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult pushAdsIdLoading(),
    @required TResult pushAdsIdSuccess(),
    @required TResult pushAdsIdFailed(),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return pushAdsIdLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult pushAdsIdLoading(),
    TResult pushAdsIdSuccess(),
    TResult pushAdsIdFailed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pushAdsIdLoading != null) {
      return pushAdsIdLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult pushAdsIdLoading(_PushAdsIdLoading value),
    @required TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    @required TResult pushAdsIdFailed(_PushAdsIdFailed value),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return pushAdsIdLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult pushAdsIdLoading(_PushAdsIdLoading value),
    TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    TResult pushAdsIdFailed(_PushAdsIdFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pushAdsIdLoading != null) {
      return pushAdsIdLoading(this);
    }
    return orElse();
  }
}

abstract class _PushAdsIdLoading implements PushAdsIdState {
  const factory _PushAdsIdLoading() = _$_PushAdsIdLoading;
}

/// @nodoc
abstract class _$PushAdsIdSuccessCopyWith<$Res> {
  factory _$PushAdsIdSuccessCopyWith(
          _PushAdsIdSuccess value, $Res Function(_PushAdsIdSuccess) then) =
      __$PushAdsIdSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$PushAdsIdSuccessCopyWithImpl<$Res>
    extends _$PushAdsIdStateCopyWithImpl<$Res>
    implements _$PushAdsIdSuccessCopyWith<$Res> {
  __$PushAdsIdSuccessCopyWithImpl(
      _PushAdsIdSuccess _value, $Res Function(_PushAdsIdSuccess) _then)
      : super(_value, (v) => _then(v as _PushAdsIdSuccess));

  @override
  _PushAdsIdSuccess get _value => super._value as _PushAdsIdSuccess;
}

/// @nodoc
class _$_PushAdsIdSuccess implements _PushAdsIdSuccess {
  const _$_PushAdsIdSuccess();

  @override
  String toString() {
    return 'PushAdsIdState.pushAdsIdSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PushAdsIdSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult pushAdsIdLoading(),
    @required TResult pushAdsIdSuccess(),
    @required TResult pushAdsIdFailed(),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return pushAdsIdSuccess();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult pushAdsIdLoading(),
    TResult pushAdsIdSuccess(),
    TResult pushAdsIdFailed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pushAdsIdSuccess != null) {
      return pushAdsIdSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult pushAdsIdLoading(_PushAdsIdLoading value),
    @required TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    @required TResult pushAdsIdFailed(_PushAdsIdFailed value),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return pushAdsIdSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult pushAdsIdLoading(_PushAdsIdLoading value),
    TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    TResult pushAdsIdFailed(_PushAdsIdFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pushAdsIdSuccess != null) {
      return pushAdsIdSuccess(this);
    }
    return orElse();
  }
}

abstract class _PushAdsIdSuccess implements PushAdsIdState {
  const factory _PushAdsIdSuccess() = _$_PushAdsIdSuccess;
}

/// @nodoc
abstract class _$PushAdsIdFailedCopyWith<$Res> {
  factory _$PushAdsIdFailedCopyWith(
          _PushAdsIdFailed value, $Res Function(_PushAdsIdFailed) then) =
      __$PushAdsIdFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PushAdsIdFailedCopyWithImpl<$Res>
    extends _$PushAdsIdStateCopyWithImpl<$Res>
    implements _$PushAdsIdFailedCopyWith<$Res> {
  __$PushAdsIdFailedCopyWithImpl(
      _PushAdsIdFailed _value, $Res Function(_PushAdsIdFailed) _then)
      : super(_value, (v) => _then(v as _PushAdsIdFailed));

  @override
  _PushAdsIdFailed get _value => super._value as _PushAdsIdFailed;
}

/// @nodoc
class _$_PushAdsIdFailed implements _PushAdsIdFailed {
  const _$_PushAdsIdFailed();

  @override
  String toString() {
    return 'PushAdsIdState.pushAdsIdFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _PushAdsIdFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult pushAdsIdLoading(),
    @required TResult pushAdsIdSuccess(),
    @required TResult pushAdsIdFailed(),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return pushAdsIdFailed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult pushAdsIdLoading(),
    TResult pushAdsIdSuccess(),
    TResult pushAdsIdFailed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pushAdsIdFailed != null) {
      return pushAdsIdFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult pushAdsIdLoading(_PushAdsIdLoading value),
    @required TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    @required TResult pushAdsIdFailed(_PushAdsIdFailed value),
  }) {
    assert(initial != null);
    assert(pushAdsIdLoading != null);
    assert(pushAdsIdSuccess != null);
    assert(pushAdsIdFailed != null);
    return pushAdsIdFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult pushAdsIdLoading(_PushAdsIdLoading value),
    TResult pushAdsIdSuccess(_PushAdsIdSuccess value),
    TResult pushAdsIdFailed(_PushAdsIdFailed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pushAdsIdFailed != null) {
      return pushAdsIdFailed(this);
    }
    return orElse();
  }
}

abstract class _PushAdsIdFailed implements PushAdsIdState {
  const factory _PushAdsIdFailed() = _$_PushAdsIdFailed;
}
