import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: const AssetImage(
              "assets/images/home.png",
            ),
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
            height: 270.h,
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "upload Your eye rays",
                  style: TextStyles.font24BlackBold,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Poisiton your eye rays within the guidelines. make sure to take the photo in a well-lit room",
                  style: TextStyles.font17GreyBold,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20.w,
                        child: SvgPicture.asset(
                          "assets/Svgs/gallery-send-svgrepo-com.svg",
                          height: 17.w,
                          width: 17.w,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 30.w,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          "assets/Svgs/camera-add-svgrepo-com.svg",
                          height: 30.w,
                          width: 30.w,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          "assets/Svgs/restore-svgrepo-com.svg",
                          height: 17.w,
                          width: 17.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppTextButton(
              buttonText: "confirm upload",
              textStyle: TextStyles.font18WhiteBold,
              backgroundColor: ColorsManager.mainColor,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
