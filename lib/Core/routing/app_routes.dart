import 'package:eye_care/Core/di/dependency_injection.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Features/Home/Logic/cubit/home_cubit.dart';
import 'package:eye_care/Features/Home/Ui/home.dart';
import 'package:eye_care/Features/Registration/Login/UI/login.dart';
import 'package:eye_care/Features/Registration/Login/logic/cubit/login_cubit.dart';
import 'package:eye_care/Features/Registration/sign_up/UI/sign_up.dart';
import 'package:eye_care/Features/Registration/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:eye_care/Features/on_boarding/Ui/on_boarding.dart';
import 'package:eye_care/Features/patient_eye_examination_report/logic/report_cubit.dart';
import 'package:eye_care/Features/patient_eye_examination_report/ui/patient_eye_examination_report.dart';
import 'package:eye_care/Features/patient_reports/logic/patient_report_cubit.dart';
import 'package:eye_care/Features/patient_reports/ui/patient_reports.dart';
import 'package:eye_care/Features/photo_feature/ui/photo_labes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:labaiik_mo3tmer/Features/on_boarding/Ui/on_boarding.dart';

class AppRouter {
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const Login(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUp(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getMyPatients(),
            child: const Home(),
          ),
        );
      case Routes.photoLabes:
        return MaterialPageRoute(builder: (_) => const PhotoLabes());
      case Routes.patientReports:
        String? patientId = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<PatientReportCubit>()
                  ..getPatientWithReport(patientId ?? 'jkdasda'),
            child: const PatientReports(),
          ),
        );
      case Routes.patientEyeExaminationReport:
        String? reportId = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ReportCubit>()..getReport(reportId!),
            child: const PatientEyeExaminationReport(),
          ),
        );
    }
  }
}
