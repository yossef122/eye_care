// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eye_care/Core/helpers/constants.dart';
import 'package:eye_care/Features/on_boarding/Ui/widgets/custom_page_view.dart';
import 'package:eye_care/Features/on_boarding/Ui/widgets/custom_smooth_dots.dart';
import 'package:eye_care/Features/on_boarding/Ui/widgets/on_boarding_buttons.dart';
import 'package:eye_care/Features/on_boarding/data/on_boarding_model.dart';
// import 'package:eye_care/generated/l10n.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  var pageboardController = PageController();

  bool isthird = false;
  @override
  Widget build(BuildContext context) {
    // List<OnBoardingModel> onBoardingPageviewList = [
    //   OnBoardingModel(
    //       bigText: S.of(context).on_boarding_one_big_text,
    //       lottie: 'assets/images/boarding1.jpg',
    //       smallText: S.of(context).on_boarding_one_small_text),
    //   OnBoardingModel(
    //     bigText: S.of(context).on_boarding_two_big_text,
    //     lottie: 'assets/images/boarding2.jpg',
    //     smallText: S.of(context).on_boarding_two_small_text,
    //   ),
    //   OnBoardingModel(
    //     bigText: S.of(context).on_boarding_three_big_text,
    //     lottie: 'assets/images/boarding3.jpg',
    //     smallText: S.of(context).on_boarding_three_small_text,
    //   ),
    // ];
    List<OnBoardingModel> onBoardingPageviewList = [
      OnBoardingModel(
        bigText: "Smarter Eye Care Starts Here",
        lottie: 'assets/images/boarding1.jpg',
        smallText:
            "Welcome to Optia — an AI-powered platform that connects opticians and doctors to deliver faster, more accurate eye care.",
      ),
      OnBoardingModel(
        bigText: "AI-Assisted Diagnosis",
        lottie: 'assets/images/boarding2.jpg',
        smallText:
            "Skilled doctors review and verify AI reports, confirm diagnoses, and guide next steps — combining speed with trusted medical expertise.",
      ),
      OnBoardingModel(
        bigText: "Your Privacy is Our Priority",
        lottie: 'assets/images/boarding3.png',
        smallText:
            "We’re committed to protecting your personal data. Built with GDPR compliance at its core, Optia ensures your information is encrypted, secure, and only used with your full consent.",
      ),

      // OnBoardingModel(
      //   bigText: "we take your privacy seriously",
      //   lottie: 'assets/images/boarding3.png',
      //   smallText:
      //       "all your data is encrypted and secure. we never sell or share it with third parties",
      // ),
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, bottom: 20, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPageView(
            isthird: AppConstants.isThird,
            pageboardController: pageboardController,
            onBoardingPageviewList: onBoardingPageviewList,
          ),
          // const SizedBox(height: 70),
          CustomSmoothDots(
            pageboardController: pageboardController,
            onBoardingPageviewList: onBoardingPageviewList,
          ),
          const SizedBox(height: 50),
          OnBoardingButtons(
            isthird: AppConstants.isThird,
            pageboardController: pageboardController,
            // context1: context,
          ),
        ],
      ),
    );
  }
}
