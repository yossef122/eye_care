import 'package:eye_care/Core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_report_state.freezed.dart';

@freezed
class PatientReportState<T> with _$PatientReportState<T> {
  const factory PatientReportState.initial() = _Initial;
  const factory PatientReportState.loading() = Loading;
  const factory PatientReportState.success(T data) = Success<T>;
  const factory PatientReportState.error(ApiErrorModel apiErrorModel) = Error;
}