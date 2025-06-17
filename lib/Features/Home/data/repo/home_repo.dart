// lib/Features/Home/data/repo/patients_repo.dart
import 'package:eye_care/Core/networking/api_error_handler.dart';
import 'package:eye_care/Core/networking/api_results.dart';
import 'package:eye_care/Features/Home/apis/home_services.dart';
import 'package:eye_care/Features/Home/data/model/patients_response_body.dart';

class PatientsRepo {
  final PatientsService _patientsService;
  PatientsRepo(this._patientsService);

  Future<ApiResults<PatientsResponseBody>> getMyPatients({
    int? limit,
    String? keyword,
  }) async {
    try {
      final response = await _patientsService.getMyPatients(
        limit: limit,
        keyword: keyword,
      );
      return ApiResults.success(response);
    } catch (error) {
      print(error);
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
