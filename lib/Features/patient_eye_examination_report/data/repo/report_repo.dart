// lib/Features/Report/data/repo/report_repo.dart
import 'package:eye_care/Core/networking/api_error_handler.dart';
import 'package:eye_care/Core/networking/api_results.dart';
import 'package:eye_care/Features/patient_eye_examination_report/apis/report_service.dart';
import 'package:eye_care/Features/patient_eye_examination_report/data/model/report_response.dart';

class ReportRepo {
  final ReportService _reportService;
  ReportRepo(this._reportService);

  Future<ApiResults<ReportResponse>> getReport(String reportId) async {
    try {
      final response = await _reportService.getReport(reportId);
      return ApiResults.success(response);
    } catch (error) {
      print(error);
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResults<void>> submitDoctorFeedback(
    String reportId,
    Map<String, dynamic> feedbackData,
  ) async {
    try {
      await _reportService.submitDoctorFeedback(reportId, feedbackData);
      return ApiResults.success(null);
    } catch (error) {
      print(error);
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
