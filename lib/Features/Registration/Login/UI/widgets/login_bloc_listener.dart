import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:eye_care/Core/networking/api_error_model.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Features/Registration/Login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (prevoius, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (BuildContext context, state) {
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              ),
            );
          },
          loginSuccess: (loginResponse) async {
            context.pop();
            context.pushNamed(Routes.homeScreen, routerNavigator: false);
          },
          loginError: (error) {
            context.pop();
            setUpErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(
          apiErrorModel.message!,
          style: TextStyles.font12BlackRegular,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.popAlert();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}

// saveToken(String token) async {
//   await CachHelper.setSecuredString(
//     value: token,
//     key: SharedKeys.userToken,
//   );
//   DioFactory.setTokenAfterLogin(token);
// }
