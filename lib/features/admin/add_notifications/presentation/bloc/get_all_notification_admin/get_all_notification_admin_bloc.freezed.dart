// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_notification_admin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetAllNotificationAdminEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllNotificationAdminEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminEvent()';
}


}

/// @nodoc
class $GetAllNotificationAdminEventCopyWith<$Res>  {
$GetAllNotificationAdminEventCopyWith(GetAllNotificationAdminEvent _, $Res Function(GetAllNotificationAdminEvent) __);
}


/// Adds pattern-matching-related methods to [GetAllNotificationAdminEvent].
extension GetAllNotificationAdminEventPatterns on GetAllNotificationAdminEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( FetchAllNotificationAdminEvent value)?  getAllNotification,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case FetchAllNotificationAdminEvent() when getAllNotification != null:
return getAllNotification(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( FetchAllNotificationAdminEvent value)  getAllNotification,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case FetchAllNotificationAdminEvent():
return getAllNotification(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( FetchAllNotificationAdminEvent value)?  getAllNotification,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case FetchAllNotificationAdminEvent() when getAllNotification != null:
return getAllNotification(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getAllNotification,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case FetchAllNotificationAdminEvent() when getAllNotification != null:
return getAllNotification();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getAllNotification,}) {final _that = this;
switch (_that) {
case _Started():
return started();case FetchAllNotificationAdminEvent():
return getAllNotification();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getAllNotification,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case FetchAllNotificationAdminEvent() when getAllNotification != null:
return getAllNotification();case _:
  return null;

}
}

}

/// @nodoc


class _Started with DiagnosticableTreeMixin implements GetAllNotificationAdminEvent {
  const _Started();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminEvent.started'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminEvent.started()';
}


}




/// @nodoc


class FetchAllNotificationAdminEvent with DiagnosticableTreeMixin implements GetAllNotificationAdminEvent {
  const FetchAllNotificationAdminEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminEvent.getAllNotification'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAllNotificationAdminEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminEvent.getAllNotification()';
}


}




/// @nodoc
mixin _$GetAllNotificationAdminState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllNotificationAdminState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminState()';
}


}

/// @nodoc
class $GetAllNotificationAdminStateCopyWith<$Res>  {
$GetAllNotificationAdminStateCopyWith(GetAllNotificationAdminState _, $Res Function(GetAllNotificationAdminState) __);
}


/// Adds pattern-matching-related methods to [GetAllNotificationAdminState].
extension GetAllNotificationAdminStatePatterns on GetAllNotificationAdminState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingState value)?  loading,TResult Function( SuccessState value)?  success,TResult Function( EmptyState value)?  empty,TResult Function( ErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case EmptyState() when empty != null:
return empty(_that);case ErrorState() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingState value)  loading,required TResult Function( SuccessState value)  success,required TResult Function( EmptyState value)  empty,required TResult Function( ErrorState value)  error,}){
final _that = this;
switch (_that) {
case LoadingState():
return loading(_that);case SuccessState():
return success(_that);case EmptyState():
return empty(_that);case ErrorState():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingState value)?  loading,TResult? Function( SuccessState value)?  success,TResult? Function( EmptyState value)?  empty,TResult? Function( ErrorState value)?  error,}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case SuccessState() when success != null:
return success(_that);case EmptyState() when empty != null:
return empty(_that);case ErrorState() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<AddNotificationModel> notificationList)?  success,TResult Function()?  empty,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.notificationList);case EmptyState() when empty != null:
return empty();case ErrorState() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<AddNotificationModel> notificationList)  success,required TResult Function()  empty,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case LoadingState():
return loading();case SuccessState():
return success(_that.notificationList);case EmptyState():
return empty();case ErrorState():
return error(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<AddNotificationModel> notificationList)?  success,TResult? Function()?  empty,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.notificationList);case EmptyState() when empty != null:
return empty();case ErrorState() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class LoadingState with DiagnosticableTreeMixin implements GetAllNotificationAdminState {
  const LoadingState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminState.loading()';
}


}




/// @nodoc


class SuccessState with DiagnosticableTreeMixin implements GetAllNotificationAdminState {
  const SuccessState({required final  List<AddNotificationModel> notificationList}): _notificationList = notificationList;
  

 final  List<AddNotificationModel> _notificationList;
 List<AddNotificationModel> get notificationList {
  if (_notificationList is EqualUnmodifiableListView) return _notificationList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notificationList);
}


/// Create a copy of GetAllNotificationAdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminState.success'))
    ..add(DiagnosticsProperty('notificationList', notificationList));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._notificationList, _notificationList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notificationList));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminState.success(notificationList: $notificationList)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $GetAllNotificationAdminStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<AddNotificationModel> notificationList
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of GetAllNotificationAdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationList = null,}) {
  return _then(SuccessState(
notificationList: null == notificationList ? _self._notificationList : notificationList // ignore: cast_nullable_to_non_nullable
as List<AddNotificationModel>,
  ));
}


}

/// @nodoc


class EmptyState with DiagnosticableTreeMixin implements GetAllNotificationAdminState {
  const EmptyState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminState.empty'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminState.empty()';
}


}




/// @nodoc


class ErrorState with DiagnosticableTreeMixin implements GetAllNotificationAdminState {
  const ErrorState({required this.error});
  

 final  String error;

/// Create a copy of GetAllNotificationAdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GetAllNotificationAdminState.error'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GetAllNotificationAdminState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $GetAllNotificationAdminStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of GetAllNotificationAdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
