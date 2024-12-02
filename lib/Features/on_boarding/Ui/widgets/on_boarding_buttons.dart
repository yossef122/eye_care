// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eye_care/Core/helpers/constants.dart';
import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:eye_care/Core/helpers/shared_pref_helper.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Core/widgets/app_button.dart';
// import 'package:eye_care/generated/l10n.dart';

class OnBoardingButtons extends StatelessWidget {
  OnBoardingButtons({
    super.key,
    required this.isthird,
    required this.pageboardController,
    // required this.context1,
  });
  var pageboardController = PageController();
  // final BuildContext context1;
  bool isthird = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          buttonText: "Next",
          backgroundColor: ColorsManager.mainColor,
          textStyle: TextStyles.font17WhiteBold,
          buttonHeight: 55.h,
          onPressed: () {
            if (AppConstants.isThird) {
              context.pushNamed(Routes.loginScreen);

              // SharedPrefHelper.setData('Isboarding', true).then((value) {
              //   if (value) {}
              // });
            } else {
              pageboardController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn);
            }
          },
          buttonWidth: MediaQuery.sizeOf(context).width * .4,
        ),
        const SizedBox(
          height: 10,
        ),
        AppTextButton(
          buttonText: "Skip",
          backgroundColor: Colors.transparent,
          textStyle: TextStyles.font14GreyBold.copyWith(
            fontSize: 20,
          ),
          buttonHeight: 60.h,
          onPressed: () {
            if (AppConstants.isThird) {
              SharedPrefHelper.setData('Isboarding', true).then((value) {
                if (value) {
                  // context.pushNamed(Routes.signUpScreen);
                  // navigatorBuilderAndfinish(
                  //   context: context,
                  //   page: LayoutScreen(),
                  // );
                }
              });
            } else {
              pageboardController.nextPage(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            }
          },
          buttonWidth: MediaQuery.sizeOf(context).width * .3,
        )
      ],
    );
  }
}
