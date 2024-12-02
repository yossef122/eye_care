// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String language) changeTheLanguageOfApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String language)? changeTheLanguageOfApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String language)? changeTheLanguageOfApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeTheLanguageOfApp value)
        changeTheLanguageOfApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeTheLanguageOfApp value)? changeTheLanguageOfApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeTheLanguageOfApp value)? changeTheLanguageOfApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationStateCopyWith<$Res> {
  factory $ApplicationStateCopyWith(
          ApplicationState value, $Res Function(ApplicationState) then) =
      _$ApplicationStateCopyWithImpl<$Res, ApplicationState>;
}

/// @nodoc
class _$ApplicationStateCopyWithImpl<$Res, $Val extends ApplicationState>
    implements $ApplicationStateCopyWith<$Res> {
  _$ApplicationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ApplicationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String language) changeTheLanguageOfApp,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String language)? changeTheLanguageOfApp,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String language)? changeTheLanguageOfApp,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeTheLanguageOfApp value)
        changeTheLanguageOfApp,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeTheLanguageOfApp value)? changeTheLanguageOfApp,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeTheLanguageOfApp value)? changeTheLanguageOfApp,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ApplicationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ChangeTheLanguageOfAppImplCopyWith<$Res> {
  factory _$$ChangeTheLanguageOfAppImplCopyWith(
          _$ChangeTheLanguageOfAppImpl value,
          $Res Function(_$ChangeTheLanguageOfAppImpl) then) =
      __$$ChangeTheLanguageOfAppImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$$ChangeTheLanguageOfAppImplCopyWithImpl<$Res>
    extends _$ApplicationStateCopyWithImpl<$Res, _$ChangeTheLanguageOfAppImpl>
    implements _$$ChangeTheLanguageOfAppImplCopyWith<$Res> {
  __$$ChangeTheLanguageOfAppImplCopyWithImpl(
      _$ChangeTheLanguageOfAppImpl _value,
      $Res Function(_$ChangeTheLanguageOfAppImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$ChangeTheLanguageOfAppImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeTheLanguageOfAppImpl implements ChangeTheLanguageOfApp {
  const _$ChangeTheLanguageOfAppImpl({required this.language});

  @override
  final String language;

  @override
  String toString() {
    return 'ApplicationState.changeTheLanguageOfApp(language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTheLanguageOfAppImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTheLanguageOfAppImplCopyWith<_$ChangeTheLanguageOfAppImpl>
      get copyWith => __$$ChangeTheLanguageOfAppImplCopyWithImpl<
          _$ChangeTheLanguageOfAppImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String language) changeTheLanguageOfApp,
  }) {
    return changeTheLanguageOfApp(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String language)? changeTheLanguageOfApp,
  }) {
    return changeTheLanguageOfApp?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String language)? changeTheLanguageOfApp,
    required TResult orElse(),
  }) {
    if (changeTheLanguageOfApp != null) {
      return changeTheLanguageOfApp(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeTheLanguageOfApp value)
        changeTheLanguageOfApp,
  }) {
    return changeTheLanguageOfApp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeTheLanguageOfApp value)? changeTheLanguageOfApp,
  }) {
    return changeTheLanguageOfApp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeTheLanguageOfApp value)? changeTheLanguageOfApp,
    required TResult orElse(),
  }) {
    if (changeTheLanguageOfApp != null) {
      return changeTheLanguageOfApp(this);
    }
    return orElse();
  }
}

abstract class ChangeTheLanguageOfApp implements ApplicationState {
  const factory ChangeTheLanguageOfApp({required final String language}) =
      _$ChangeTheLanguageOfAppImpl;

  String get language;
  @JsonKey(ignore: true)
  _$$ChangeTheLanguageOfAppImplCopyWith<_$ChangeTheLanguageOfAppImpl>
      get copyWith => throw _privateConstructorUsedError;
}
