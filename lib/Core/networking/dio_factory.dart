import 'package:dio/dio.dart';
import 'package:eye_care/Core/helpers/cach_helper.dart';
import 'package:eye_care/Core/helpers/shared_key.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      await addDioHeaders(); // Await here to ensure headers are set
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioLogger();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> addDioHeaders() async {
    print(await CachHelper.getSecuredString(key: SharedKeys.userToken));
    print(
      'userToken ${await CachHelper.getSecuredString(key: SharedKeys.userToken)}',
    );
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${await CachHelper.getSecuredString(key: SharedKeys.userToken)}',
    };
  }

  static void setTokenAfterLogin(String? token) async {
    print(token);
    dio?.options.headers = {'Authorization': "Bearer $token"};
  }

  static void addDioLogger() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
