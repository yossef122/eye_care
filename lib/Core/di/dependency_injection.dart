import 'package:dio/dio.dart';
import 'package:eye_care/Core/all_application_cubit/application_cubit.dart';
import 'package:eye_care/Core/networking/dio_factory.dart';
import 'package:eye_care/Features/Home/Logic/cubit/home_cubit.dart';
import 'package:eye_care/Features/Home/apis/home_services.dart';
import 'package:eye_care/Features/Home/data/repo/home_repo.dart';
import 'package:eye_care/Features/Registration/Login/apis/login_service.dart';
import 'package:eye_care/Features/Registration/Login/data/repo/login_repo.dart';
import 'package:eye_care/Features/Registration/Login/logic/cubit/login_cubit.dart';
import 'package:eye_care/Features/Registration/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:eye_care/Features/patient_eye_examination_report/apis/report_service.dart';
import 'package:eye_care/Features/patient_eye_examination_report/data/repo/report_repo.dart';
import 'package:eye_care/Features/patient_eye_examination_report/logic/report_cubit.dart';
import 'package:eye_care/Features/patient_reports/apis/patient_report_service.dart';
import 'package:eye_care/Features/patient_reports/data/repo/patient_report_repo.dart';
import 'package:eye_care/Features/patient_reports/logic/patient_report_cubit.dart';
import 'package:get_it/get_it.dart';
// import 'package:labaiik_mo3tmer/Core/all_application_cubit/application_cubit.dart';
// import 'package:labaiik_mo3tmer/Features/drawer_options/Ui/Contact%20us/Logic/cubit/contact_us_cubit.dart';
// import 'package:labaiik_mo3tmer/Features/drawer_options/Ui/transation/logic/cubit/transaction_cubit.dart';
// import 'package:labaiik_mo3tmer/Features/home/logic/cubit/home_cubit.dart';
// import 'package:labaiik_mo3tmer/Features/registration/login/Logic/cubit/login_cubit.dart';
// import 'package:labaiik_mo3tmer/Features/registration/sign_up/Logic/cubit/sign_up_cubit.dart';
// import 'package:labaiik_mo3tmer/Features/umrah-seekers/Logic/cubit/umrah_seekers_cubit.dart';
// import 'package:labaiik_mo3tmer/Features/request_3omrah/Logic/umrah_details_cubit/cubit/umrah_details_cubit.dart';

final getIt = GetIt.instance;

Future<void> setGetIt() async {
  Dio dio = await DioFactory.getDio();

  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  // getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<ApplicationCubit>(() => ApplicationCubit());

  getIt.registerLazySingleton<LoginService>(() => LoginService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<PatientsService>(() => PatientsService(dio));
  getIt.registerLazySingleton<PatientsRepo>(() => PatientsRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<PatientReportService>(
    () => PatientReportService(dio),
  );
  getIt.registerLazySingleton<PatientReportRepo>(
    () => PatientReportRepo(getIt()),
  );
  getIt.registerFactory<PatientReportCubit>(() => PatientReportCubit(getIt()));

  getIt.registerLazySingleton<ReportService>(() => ReportService(dio));
  getIt.registerLazySingleton<ReportRepo>(() => ReportRepo(getIt()));
  getIt.registerFactory<ReportCubit>(() => ReportCubit(getIt()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit());
}
