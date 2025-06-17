import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
// import 'package:eye_care/generated/l10n.dart';

class RegistrationMiddleDivider extends StatelessWidget {
  const RegistrationMiddleDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 90.w,
          color: ColorsManager.lightgrey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or",
            // S.of(context).OR,
            style: TextStyles.font18BlackBold,
          ),
        ),
        Container(
          height: 1,
          width: 90.w,
          color: ColorsManager.lightgrey,
        ),
      ],
    );
  }
}
