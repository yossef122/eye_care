part of 'login_cubit.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.changeObsecureState({required bool isObsecured}) =
      ChangeObsecureState;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(T data) = LoginSuccess<T>;
  const factory LoginState.loginError(ApiErrorModel apiErrorModel) = LoginError;
}
