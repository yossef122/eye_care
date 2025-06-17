import 'package:dio/dio.dart';
import 'package:eye_care/Core/networking/api_constants.dart';
import 'package:eye_care/Features/Registration/Login/apis/login_constants.dart';
import 'package:eye_care/Features/Registration/Login/data/model/login_request_body.dart';
import 'package:eye_care/Features/Registration/Login/data/model/login_response_body.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST(LoginConstants.loginEndPoint)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

}
