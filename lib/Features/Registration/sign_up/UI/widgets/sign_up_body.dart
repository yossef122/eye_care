import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Core/widgets/app_button.dart';
import 'package:eye_care/Core/widgets/app_text_formField.dart';
import 'package:eye_care/Core/widgets/registration_middle_divider.dart';
import 'package:eye_care/Features/Registration/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:eye_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';

// class SignUpBody extends StatelessWidget {
//   const SignUpBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [],
//     );
//   }
// }

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
                      "SignUp",
                      style: TextStyles.font40WhiteBold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AlreadyHaveAccount()
          ],
        ),
        const SignUpInfoBody()
      ],
    );
  }
}

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 130,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Are you have account ? ",
            style: TextStyles.font16GreyNormal,
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: Text(
              "Login",
              style: TextStyles.font18GoldNormal,
            ),
          )
        ],
      ),
    );
  }
}

class SignUpInfoBody extends StatelessWidget {
  const SignUpInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 48,
      height: 598.h,
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
          key: context.read<SignUpCubit>().formKey,
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Eye Care",
                      style: TextStyles.font24BlackBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      textFormField: S.of(context).Name_form_field,
                      textHintField: S.of(context).Name_hint_form_field,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      textFormField: S.of(context).Email_form_field,
                      textHintField: S.of(context).Email_hint_form_field,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomPasswordFormField(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: CustomFormField(
                            textFormField: "Age",
                            textHintField: "Enter your age",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomFormField(
                            textFormField: "Gender",
                            textHintField: "Enter your gender",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: AppTextButton(
                        buttonText: S.of(context).SignUp_button,
                        backgroundColor: ColorsManager.mainColor,
                        textStyle: TextStyles.font17WhiteBold,
                        buttonHeight: 55.h,
                        onPressed: () {
                          // context.pushNamed(Routes.locationPersmsion);
                          validateThenSignUp(context);
                        },
                        buttonWidth: MediaQuery.sizeOf(context).width * .4,
                      ),
                    ),
                    const RegistrationMiddleDivider(),
                    // const SizedBox(
                    //   height: 15,
                    // ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomPasswordFormField extends StatelessWidget {
  const CustomPasswordFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Column(
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
              isObscureText: context.read<SignUpCubit>().isObsecured ?? true,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<SignUpCubit>().changeObsercure();
                },
                icon: context.read<SignUpCubit>().isObsecured!
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
              controller: context.read<SignUpCubit>().passwordController,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              hintText: S.of(context).Password_hint_form_field,
              hintStyle: TextStyles.font16GreyNormal,
            ),
          ],
        );
      },
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.textFormField,
    required this.textHintField,
  });
  final String textFormField;
  final String textHintField;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFormField,
          style: TextStyles.font18BlackBold,
        ),
        const SizedBox(
          height: 5,
        ),
        AppTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$textFormField must not be empty';
            }
            return null;
          },
          // controller: context.read<SignUpCubit>().emailController,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          hintText: textHintField,
          hintStyle: TextStyles.font16GreyNormal,
        ),
      ],
    );
  }
}

void validateThenSignUp(BuildContext context) {
  if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
    // print("Please");
    context.pushNamed(Routes.homeScreen);
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
