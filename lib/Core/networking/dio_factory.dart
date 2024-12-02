import 'package:dio/dio.dart';
import 'package:eye_care/Core/helpers/shared_key.dart';
import 'package:eye_care/Core/helpers/shared_pref_helper.dart';
// import 'package:doc_doc2/Core/helpers/shared_key.dart';
// import 'package:doc_doc2/Core/helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioLogger();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(SharedKeys.userToken)}',
    };
  }

  static void setTokenAfterLogin(String token) async {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
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
