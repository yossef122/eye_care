part of 'application_cubit.dart';

@freezed
class ApplicationState with _$ApplicationState {
  const factory ApplicationState.initial() = _Initial;
  const factory ApplicationState.changeTheLanguageOfApp({required String language}) = ChangeTheLanguageOfApp;

}

// abstract class ApplicationState {}

// class initial extends ApplicationState {}

// class RegisterLoadingState extends ApplicationState {}

// class RegisterSuccessState extends ApplicationState {
//   final String? uid;
//   RegisterSuccessState(this.uid);
// }
