// lib/Features/Report/logic/report_state.dart

import 'package:eye_care/Core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_state.freezed.dart';

@freezed
class ReportState<T> with _$ReportState<T> {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = Loading;
  const factory ReportState.success(T data) = Success<T>;
  const factory ReportState.error(ApiErrorModel apiErrorModel) = Error;
  const factory ReportState.feedbackSubmitted() = FeedbackSubmitted;
}
