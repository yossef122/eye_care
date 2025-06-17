import 'package:eye_care/Core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.getPatientloading() = GetPatientloading;
  const factory HomeState.getPatientsuccess(T data) = GetPatientsuccess<T>;
  const factory HomeState.getPatienterror(ApiErrorModel apiErrorModel) = GetPatienterror;
}
