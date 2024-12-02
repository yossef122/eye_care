

import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
import 'package:eye_care/Core/all_application_cubit/application_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eye_care/Core/di/dependency_injection.dart';
import 'package:eye_care/Core/helpers/cach_helper.dart';
import 'package:eye_care/Core/routing/app_routes.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/colors.dart';
// import 'package:labaiik_mo3tmer/Core/widgets/no_internet.dart';
import 'generated/l10n.dart';

class EyeCare extends StatefulWidget {
  const EyeCare({super.key});

  @override
  State<EyeCare> createState() => LlabaiiMmo3tmerState();
}

class LlabaiiMmo3tmerState extends State<EyeCare> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => getIt<ApplicationCubit>(),
        child: BlocBuilder<ApplicationCubit, ApplicationState>(
          builder: (context, state) {
            // // String language = SharedPrefHelper.getString("app_lang") ?? "en";
            String language = CachHelper.getData(key: "app_lang") ?? "en";
            // String language = "en";

            if (state is ChangeTheLanguageOfApp) {
              language = state.language;
            }
            print(language);

            return MaterialApp(
              locale: Locale(language),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: "Doc App",
              theme: ThemeData(
                primaryColor: ColorsManager.mainBlue,
                scaffoldBackgroundColor: Colors.white,
              ),
              debugShowCheckedModeBanner: false,
              // initialRoute: AppConstants.isLogged ? Routes.homeScreen : Routes.onBoardingScreen,
              // initialRoute: Routes.layout,
              initialRoute: Routes.onBoardingScreen,
              onGenerateRoute: AppRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
