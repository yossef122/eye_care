// lib/Features/PatientReport/data/repo/patient_report_repo.dart
import 'package:eye_care/Core/networking/api_error_handler.dart';
import 'package:eye_care/Core/networking/api_results.dart';
import 'package:eye_care/Features/patient_reports/apis/patient_report_service.dart';
import 'package:eye_care/Features/patient_reports/data/model/patient_report_response.dart';

class PatientReportRepo {
  final PatientReportService _patientReportService;
  PatientReportRepo(this._patientReportService);

  Future<ApiResults<PatientReportResponse>> getPatientWithReport(
    String patientId,
  ) async {
    try {
      final response = await _patientReportService.getPatientWithReport(
        patientId,
      );
      return ApiResults.success(response);
    } catch (error) {
      print(error);
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
