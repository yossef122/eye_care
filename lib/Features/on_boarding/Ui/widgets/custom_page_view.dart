// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:eye_care/Core/helpers/constants.dart';
import 'package:eye_care/Features/on_boarding/Ui/widgets/custom_page_view_builder.dart';
import 'package:eye_care/Features/on_boarding/data/on_boarding_model.dart';

class CustomPageView extends StatefulWidget {
  final PageController pageboardController;
  late bool isthird;
  final List<OnBoardingModel> onBoardingPageviewList;

  CustomPageView({
    super.key,
    required this.pageboardController,
    required this.isthird,
    required this.onBoardingPageviewList,
  });

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            // OnBoardingCubit.get(context)
            // .checkIfThird(index == onBoardingPageviewList.length - 1);
            AppConstants.isThird =
                index == widget.onBoardingPageviewList.length - 1;
          });
        },
        controller: widget.pageboardController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CustomPageViewBuilder(
          bigText: widget.onBoardingPageviewList[index].bigText!,
          image: widget.onBoardingPageviewList[index].lottie!,
          smallText: widget.onBoardingPageviewList[index].smallText!,
        ),
        itemCount: widget.onBoardingPageviewList.length,
      ),
    );
  }
}
