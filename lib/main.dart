import 'package:eye_care/Core/bloc_observer/bloc_observer.dart';
import 'package:eye_care/Core/di/dependency_injection.dart';
import 'package:eye_care/Core/helpers/cach_helper.dart';
import 'package:eye_care/Core/helpers/constants.dart';
import 'package:eye_care/Core/helpers/shared_key.dart';
import 'package:eye_care/eye_care.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setGetIt(); // Make sure this is called
  await ScreenUtil.ensureScreenSize();
  await CachHelper.init();
  await checkUserLogged();

  runApp(const EyeCare());
}

Future<void> checkUserLogged() async {
  // bool? isLogged = await CachHelper.getData(key: SharedKeys.isLogged);
  String? userToken = await CachHelper.getSecuredString(
    key: SharedKeys.userToken,
  );
  print(userToken);
  if (userToken != null) {
    AppConstants.isLogged = true;
  } else {
    AppConstants.isLogged = false;
  }
}
