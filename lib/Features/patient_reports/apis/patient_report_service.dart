// lib/Features/PatientReport/data/apis/patient_report_service.dart
import 'package:dio/dio.dart';
import 'package:eye_care/Core/networking/api_constants.dart';
import 'package:eye_care/Features/patient_reports/apis/patient_report_constants.dart';
import 'package:eye_care/Features/patient_reports/data/model/patient_report_response.dart';
import 'package:retrofit/retrofit.dart';

part 'patient_report_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class PatientReportService {
  factory PatientReportService(Dio dio, {String baseUrl}) = _PatientReportService;

  @GET('${PatientReportConstants.patientWithReportEndPoint}/{patientId}')
  Future<PatientReportResponse> getPatientWithReport(
    @Path('patientId') String patientId,
  );
}