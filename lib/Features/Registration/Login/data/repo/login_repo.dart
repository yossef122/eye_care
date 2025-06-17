
import 'package:eye_care/Core/networking/api_error_handler.dart';
import 'package:eye_care/Core/networking/api_results.dart';
import 'package:eye_care/Features/Registration/Login/apis/login_service.dart';
import 'package:eye_care/Features/Registration/Login/data/model/login_request_body.dart';
import 'package:eye_care/Features/Registration/Login/data/model/login_response_body.dart';

class LoginRepo {
  final LoginService _loginService;
  LoginRepo(this._loginService);

  Future<ApiResults<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _loginService.login(loginRequestBody);
      return ApiResults.success(response);
    } catch (error) {
      return ApiResults.failure(ApiErrorHandler.handle(error));
    }
  }
}
