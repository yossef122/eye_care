part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.changeObsecureState({required bool isObsecured}) =
      ChangeObsecureState;
}
