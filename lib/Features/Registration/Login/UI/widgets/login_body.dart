import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Core/widgets/app_button.dart';
import 'package:eye_care/Core/widgets/app_text_formField.dart';
import 'package:eye_care/Core/widgets/registration_middle_divider.dart';
import 'package:eye_care/Features/Registration/Login/logic/cubit/login_cubit.dart';
import 'package:eye_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 568.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(60),
                ),
                color: ColorsManager.mainColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 49.h, horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyles.font40WhiteBold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const DonotHaveAccount()
          ],
        ),
        const LoginInfoBody()
      ],
    );
  }
}

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don’t have an account? ",
            style: TextStyles.font16GreyNormal,
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.signUpScreen);
            },
            child: Text(
              "Sign up",
              style: TextStyles.font18GoldNormal,
            ),
          )
        ],
      ),
    );
  }
}

class LoginInfoBody extends StatelessWidget {
  const LoginInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 48,
      height: 500.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: context.read<LoginCubit>().formKey,
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Eye Care",
                    style: TextStyles.font24BlackBold,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Email_form_field,
                        style: TextStyles.font18BlackBold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${S.of(context).Email_form_field} must not be empty';
                          }
                          return null;
                        },
                        // controller: context.read<LoginCubit>().emailController,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        hintText: S.of(context).Email_hint_form_field,
                        hintStyle: TextStyles.font16GreyNormal,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Password_form_field,
                        style: TextStyles.font18BlackBold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFormField(
                        isObscureText:
                            context.read<LoginCubit>().isObsecured ?? true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<LoginCubit>().changeObsercure();
                          },
                          icon: context.read<LoginCubit>().isObsecured!
                              ? const Icon(
                                  Icons.remove_red_eye,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '${S.of(context).Password_form_field} must not be empty';
                          }
                          return null;
                        },
                        controller:
                            context.read<LoginCubit>().passwordController,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        hintText: S.of(context).Password_hint_form_field,
                        hintStyle: TextStyles.font16GreyNormal,
                      ),
                      // BuildPhoneFormField(
                      //   controller: context.read<LoginCubit>().phoneController,
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: AppTextButton(
                          buttonText: S.of(context).Login_button,
                          backgroundColor: ColorsManager.mainColor,
                          textStyle: TextStyles.font17WhiteBold,
                          buttonHeight: 55.h,
                          onPressed: () {
                            // context.pushNamed(Routes.locationPersmsion);
                            validateThenLogin(context);
                          },
                          buttonWidth: MediaQuery.sizeOf(context).width * .4,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const RegistrationMiddleDivider(),
                      const SizedBox(
                        height: 15,
                      ),
                      GoogleAuthButton(
                        onPressed: () {},
                        buttonColor: Colors.white,
                        borderRadius: 20,
                        borderColor: const Color.fromRGBO(
                          128,
                          128,
                          128,
                          0.5,
                        ),
                        height: 50.h,
                        text: S.of(context).google_register_button,
                        iconSize: 24.dg,
                        // padding: EdgeInsets.symmetric(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

void validateThenLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    // print(context.read<LoginCubit>().formKey.currentState!.validate());

    // if (context.read<LoginCubit>().passwordController.text.toString().isNotEmpty &&
    //     context.read<LoginCubit>().phoneController.text.toString().length >
    //         10) {
    // print("Please");
    context.pushNamed(Routes.homeScreen);
    // }
  }
}

class MainPhoto extends StatelessWidget {
  const MainPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: MediaQuery.sizeOf(context).width,
      child: const Center(
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/main_iamge-removebg-preview-removebg-preview.png",
          ),
        ),
      ),
    );
  }
}
