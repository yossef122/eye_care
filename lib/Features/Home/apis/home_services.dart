// lib/Features/Home/data/apis/patients_service.dart
import 'package:dio/dio.dart';
import 'package:eye_care/Core/networking/api_constants.dart';
import 'package:eye_care/Features/Home/apis/home_constants.dart';
import 'package:eye_care/Features/Home/data/model/patients_response_body.dart';
import 'package:retrofit/retrofit.dart';

part 'home_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class PatientsService {
  factory PatientsService(Dio dio, {String baseUrl}) = _PatientsService;

  @GET(PatientConstants.myPatientsEndPoint)
  Future<PatientsResponseBody> getMyPatients({
    @Query('limit') int? limit,
    @Query('keyword') String? keyword,
  });
}