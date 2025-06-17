import 'package:dio/dio.dart';
import 'package:eye_care/Core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  
  // @POST(ApiConstants.login)
  // Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);
  
  // @POST(ApiConstants.register)
  // Future<SignUpResponseBody> signUp(@Body() SignUpRequestBody signUpRequestBody);
}
