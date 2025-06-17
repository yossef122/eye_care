// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eye_care/Core/helpers/cach_helper.dart';

// import 'package:ka3ba/Core/helpers/constants.dart';

part 'application_state.dart';
part 'application_cubit.freezed.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(const ApplicationState.initial());
  static ApplicationCubit get(context) => BlocProvider.of(context);

  bool isArabic = CachHelper.getData(key: "app_lang") == "ar" ? true : false;
  static Locale locale = const Locale("en");
  String language = "en";
  getlanguage(String language) {
    if (language == "ar") {
      // AppConstants.isArabic = true;
      isArabic = true;
      CachHelper.saveData(value: "ar", key: "app_lang");
    } else {
      // AppConstants.isArabic = false;
      isArabic = false;
      CachHelper.saveData(value: "en", key: "app_lang");
    }
    language = language;
    // print("AppConstants ${AppConstants.isArabic}");
    // print("cubit ${isArabic}");
    emit(ApplicationState.changeTheLanguageOfApp(language: language));
  }
}
