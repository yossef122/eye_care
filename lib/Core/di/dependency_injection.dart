import 'package:eye_care/Core/all_application_cubit/application_cubit.dart';
import 'package:eye_care/Features/Registration/Login/logic/cubit/login_cubit.dart';
import 'package:eye_care/Features/Registration/sign_up/logic/cubit/sign_up_cubit.dart';
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
  // Dio dio = DioFactory.getDio();

  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  // getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
    getIt.registerFactory<ApplicationCubit>(() => ApplicationCubit());
    getIt.registerFactory<LoginCubit>(() => LoginCubit());
    getIt.registerFactory<SignUpCubit>(() => SignUpCubit());


}
