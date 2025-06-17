// lib/Features/Report/data/apis/report_service.dart
import 'package:dio/dio.dart';
import 'package:eye_care/Core/networking/api_constants.dart';
import 'package:eye_care/Features/patient_eye_examination_report/apis/report_constants.dart';
import 'package:eye_care/Features/patient_eye_examination_report/data/model/report_response.dart';
import 'package:retrofit/retrofit.dart';

part 'report_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ReportService {
  factory ReportService(Dio dio, {String baseUrl}) = _ReportService;

  @GET('${ReportConstants.myReportEndPoint}/{reportId}')
  Future<ReportResponse> getReport(@Path('reportId') String reportId);

  @PUT('${ReportConstants.myReportEndPoint}/{reportId}')
  Future<void> submitDoctorFeedback(
    @Path('reportId') String reportId,
    @Body() Map<String, dynamic> feedbackData,
  );
}
