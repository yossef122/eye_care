import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:eye_care/Core/themes/styles.dart';

class CustomPageViewBuilder extends StatelessWidget {
  final String image;
  final String bigText;
  final String smallText;

  const CustomPageViewBuilder({
    super.key,
    required this.image,
    required this.bigText,
    required this.smallText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              bigText,
              style: TextStyles.font18BlackBold,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 37.7,
              ),
              child: Text(
                smallText,
                style: TextStyles.font14GreyBold,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
        // const SizedBox(height: 20),
        Image(
          height: 280.h,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ],
    );
  }
}
