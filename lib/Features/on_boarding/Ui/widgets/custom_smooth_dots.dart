import 'package:flutter/material.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Features/on_boarding/data/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothDots extends StatelessWidget {
  const CustomSmoothDots({
    super.key,
    required this.pageboardController,
    required this.onBoardingPageviewList,
  });

  final PageController pageboardController;
  final List<OnBoardingModel> onBoardingPageviewList;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageboardController,
      count: onBoardingPageviewList.length,
      effect: const ExpandingDotsEffect(
        dotColor: Color.fromRGBO(217, 217, 217, 1),
        dotHeight: 12,
        dotWidth: 12,
        activeDotColor: ColorsManager.mainColor,
        expansionFactor: 1.1,
        spacing: 15,
      ),
    );
  }
}
