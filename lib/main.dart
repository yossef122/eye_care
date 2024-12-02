import 'package:eye_care/Core/bloc_observer/bloc_observer.dart';
import 'package:eye_care/Core/di/dependency_injection.dart';
import 'package:eye_care/Core/helpers/cach_helper.dart';
import 'package:eye_care/eye_care.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setGetIt();
  await ScreenUtil.ensureScreenSize();
  await CachHelper.init();
  runApp(const EyeCare());
}

