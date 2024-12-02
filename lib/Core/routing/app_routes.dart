import 'package:eye_care/Core/di/dependency_injection.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Features/Home/Ui/home.dart';
import 'package:eye_care/Features/Registration/Login/UI/login.dart';
import 'package:eye_care/Features/Registration/Login/logic/cubit/login_cubit.dart';
import 'package:eye_care/Features/Registration/sign_up/UI/sign_up.dart';
import 'package:eye_care/Features/Registration/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:eye_care/Features/on_boarding/Ui/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:labaiik_mo3tmer/Features/on_boarding/Ui/on_boarding.dart';

class AppRouter {
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<OnBoardingCubit>(),
      //       child: const OnBoarding(),
      //     ),
      //   );
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => OfflineBuilder(
      //             connectivityBuilder: (BuildContext context,
      //                 List<ConnectivityResult> connectivity, Widget child) {
      //               final bool connected =
      //                   !connectivity.contains(ConnectivityResult.none);
      //               if (connected) {
      //                 return const SignUp();
      //               } else {
      //                 return const NoInternet();
      //               }
      //             },
      //           )
      //       // child: const SignUp()),
      //       );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoarding(),
        );
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
          builder: (_) => const Home(),
        );
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       Future.delayed(const Duration(seconds: 1), () {
      //         exit(0);

      //         // Method 2: Politely close the app (recommended for Android)
      //         // SystemNavigator.pop();
      //       });

      //       return Scaffold(
      //         body: Center(
      //           child: Text('No route found for ${settings.name}'),
      //         ),
      //       );
      //     },
      //   );
    }
  }
}
