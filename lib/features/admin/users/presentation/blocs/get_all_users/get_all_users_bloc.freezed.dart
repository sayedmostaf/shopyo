// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetAllUsersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllUsersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllUsersEvent()';
}


}

/// @nodoc
class $GetAllUsersEventCopyWith<$Res>  {
$GetAllUsersEventCopyWith(GetAllUsersEvent _, $Res Function(GetAllUsersEvent) __);
}


/// Adds pattern-matching-related methods to [GetAllUsersEvent].
extension GetAllUsersEventPatterns on GetAllUsersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( FetchAllUsersEvent value)?  getAllUsers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case FetchAllUsersEvent() when getAllUsers != null:
return getAllUsers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( FetchAllUsersEvent value)  getAllUsers,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case FetchAllUsersEvent():
return getAllUsers(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( FetchAllUsersEvent value)?  getAllUsers,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case FetchAllUsersEvent() when getAllUsers != null:
return getAllUsers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( bool isNotLoading)?  getAllUsers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case FetchAllUsersEvent() when getAllUsers != null:
return getAllUsers(_that.isNotLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( bool isNotLoading)  getAllUsers,}) {final _that = this;
switch (_that) {
case _Started():
return started();case FetchAllUsersEvent():
return getAllUsers(_that.isNotLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( bool isNotLoading)?  getAllUsers,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case FetchAllUsersEvent() when getAllUsers != null:
return getAllUsers(_that.isNotLoading);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GetAllUsersEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllUsersEvent.started()';
}


}




/// @nodoc


class FetchAllUsersEvent implements GetAllUsersEvent {
  const FetchAllUsersEvent({required this.isNotLoading});
  

 final  bool isNotLoading;

/// Create a copy of GetAllUsersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchAllUsersEventCopyWith<FetchAllUsersEvent> get copyWith => _$FetchAllUsersEventCopyWithImpl<FetchAllUsersEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAllUsersEvent&&(identical(other.isNotLoading, isNotLoading) || other.isNotLoading == isNotLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isNotLoading);

@override
String toString() {
  return 'GetAllUsersEvent.getAllUsers(isNotLoading: $isNotLoading)';
}


}

/// @nodoc
abstract mixin class $FetchAllUsersEventCopyWith<$Res> implements $GetAllUsersEventCopyWith<$Res> {
  factory $FetchAllUsersEventCopyWith(FetchAllUsersEvent value, $Res Function(FetchAllUsersEvent) _then) = _$FetchAllUsersEventCopyWithImpl;
@useResult
$Res call({
 bool isNotLoading
});




}
/// @nodoc
class _$FetchAllUsersEventCopyWithImpl<$Res>
    implements $FetchAllUsersEventCopyWith<$Res> {
  _$FetchAllUsersEventCopyWithImpl(this._self, this._then);

  final FetchAllUsersEvent _self;
  final $Res Function(FetchAllUsersEvent) _then;

/// Create a copy of GetAllUsersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isNotLoading = null,}) {
  return _then(FetchAllUsersEvent(
isNotLoading: null == isNotLoading ? _self.isNotLoading : isNotLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$GetAllUsersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllUsersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllUsersState()';
}


}

/// @nodoc
class $GetAllUsersStateCopyWith<$Res>  {
$GetAllUsersStateCopyWith(GetAllUsersState _, $Res Function(GetAllUsersState) __);
}


/// Adds pattern-matching-related methods to [GetAllUsersState].
extension GetAllUsersStatePatterns on GetAllUsersState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<UsersModel> userList)?  success,TResult Function()?  empty,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.userList);case EmptyState() when empty != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<UsersModel> userList)  success,required TResult Function()  empty,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case LoadingState():
return loading();case SuccessState():
return success(_that.userList);case EmptyState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<UsersModel> userList)?  success,TResult? Function()?  empty,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case SuccessState() when success != null:
return success(_that.userList);case EmptyState() when empty != null:
return empty();case ErrorState() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class LoadingState implements GetAllUsersState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllUsersState.loading()';
}


}




/// @nodoc


class SuccessState implements GetAllUsersState {
  const SuccessState({required final  List<UsersModel> userList}): _userList = userList;
  

 final  List<UsersModel> _userList;
 List<UsersModel> get userList {
  if (_userList is EqualUnmodifiableListView) return _userList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userList);
}


/// Create a copy of GetAllUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._userList, _userList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userList));

@override
String toString() {
  return 'GetAllUsersState.success(userList: $userList)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $GetAllUsersStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<UsersModel> userList
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of GetAllUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userList = null,}) {
  return _then(SuccessState(
userList: null == userList ? _self._userList : userList // ignore: cast_nullable_to_non_nullable
as List<UsersModel>,
  ));
}


}

/// @nodoc


class EmptyState implements GetAllUsersState {
  const EmptyState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllUsersState.empty()';
}


}




/// @nodoc


class ErrorState implements GetAllUsersState {
  const ErrorState({required this.error});
  

 final  String error;

/// Create a copy of GetAllUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetAllUsersState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $GetAllUsersStateCopyWith<$Res> {
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

/// Create a copy of GetAllUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorState(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
