import 'package:eye_care/Core/widgets/app_button.dart';
import 'package:eye_care/Features/Registration/Login/UI/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/generated/l10n.dart';
import 'package:dropdown_search/dropdown_search.dart';

class PhotoLabesBody extends StatelessWidget {
  const PhotoLabesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MainText(),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CustomDragDrop(
                  formText: S.of(context).Status_options,
                  formValidator: '',
                  optionList: const ["Male", "Female"],
                ),
                const SizedBox(height: 15),
                CustomDragDrop(
                  formText: "Type of eye disease",
                  formValidator: '',
                  optionList: const [
                    "optic_disc",
                    "vessels",
                    "macula",
                    "DR_SDRG",
                    "DR_ICDR",
                    "focus",
                    "Illuminaton",
                    "image_field",
                    "artifacts",
                    "diabetic_retinopathy",
                    "macular_edema",
                    "scar",
                    "nevus",
                    "amd",
                    "vascular_occlusion",
                    "hypertensive_retinopathy",
                    "drusens",
                    "hemorrhage",
                    "retinal_detachment",
                    "myopic_fundus",
                    "increased_cup_disc",
                    "other",
                  ],
                ),
                const SizedBox(height: 15),
                CustomDragDrop(
                  formText: "Age",
                  formValidator: '',
                  optionList: const [
                    "10-19",
                    "20-29",
                    "30-39",
                    "40-49",
                    "50-59",
                    "60--",
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppTextButton(
              buttonText: "upload data with photo",
              textStyle: TextStyles.font18WhiteBold,
              backgroundColor: ColorsManager.mainColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

// class MainText extends StatelessWidget {
//   const MainText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: RichText(
//         text: TextSpan(
//           text: 'Eye ',
//           style: TextStyles.font22BlackSemiBold,
//           children: [
//             TextSpan(
//               text: 'Care',
//               style: TextStyles.font22CyanSemiBold,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomDragDrop extends StatelessWidget {
  CustomDragDrop({
    super.key,
    this.selectedItem,
    required this.formText,
    required this.formValidator,
    required this.optionList,
  });
  String? selectedItem;

  final String formText;
  final String formValidator;
  final List<String> optionList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(formText, style: TextStyles.font18BlackBold),
        const SizedBox(height: 8),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            showSelectedItems: true,
            containerBuilder: (ctx, popupWidget) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: popupWidget,
              );
            },
            disabledItemFn: (String s) => s.startsWith('I'),
            itemBuilder: (context, item, isSelected) {
              return Container(
                color: isSelected
                    ? Colors.cyan.withOpacity(0.2)
                    : Colors.transparent,
                child: ListTile(
                  title: Center(
                    child: Text(item, style: TextStyles.font18BlackBold),
                  ),
                ),
              );
            },
          ),
          validator: (String? value) {
            if (value!.isEmpty) {
              return formValidator;
            }
            return null;
          },

          items: optionList,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: S.of(context).select_hint,
              hintStyle: TextStyles.font14GreyRegular.copyWith(
                fontSize: 17.sp,
                color: const Color.fromARGB(77, 77, 77, 1),
              ),
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.mainColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.mainColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.3),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.3),
                borderRadius: BorderRadius.circular(16.0),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: ColorsManager.mainColor,
                  width: 1.3,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ),
          ),
          onChanged: (e) {
            selectedItem = e;
          },
          selectedItem:
              selectedItem ??
              optionList.first, // Default to the first option if not provided
          // selectedItem: selectedItem,
        ),
      ],
    );
  }
}
