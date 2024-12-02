// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:eye_care/Core/themes/colors.dart';
// import 'package:eye_care/Core/themes/styles.dart';
// import 'package:eye_care/Features/drawer_options/Ui/transation/logic/cubit/transaction_cubit.dart';
// import 'package:labaiik_mo3tmer/generated/l10n.dart';

// class CustomDragDrop extends StatelessWidget {
//   CustomDragDrop({
//     super.key,
//     this.selectedItem,
//     required this.formText,
//     required this.formValidator,
//     required this.optionList,
//     required this.inputHint,
//   });
//   String? selectedItem;

//   final String formText;
//   final String inputHint;
//   final String formValidator;
//   final List<String> optionList;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TransactionCubit, TransactionState>(
//       builder: (context, state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               formText,
//               style: TextStyles.font18BlackBold,
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             DropdownSearch<String>(
//               popupProps: PopupProps.menu(
//                 fit: FlexFit.loose,
//                 showSelectedItems: true,
//                 containerBuilder: (ctx, popupWidget) {
//                   return Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12,
//                       horizontal: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: popupWidget,
//                   );
//                 },
//                 disabledItemFn: (String s) => s.startsWith('I'),
//                 itemBuilder: (context, item, isSelected) {
//                   return Container(
//                     color: isSelected
//                         ? Colors.cyan.withOpacity(0.2)
//                         : Colors.transparent,
//                     child: ListTile(
//                       title: Center(
//                         child: Text(
//                           item,
//                           style: TextStyles.font18BlackBold,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               validator: (String? value) {
//                 if (value!.isEmpty) {
//                   return formValidator;
//                 }
//                 return null;
//               },
//               items: optionList,
//               dropdownDecoratorProps: DropDownDecoratorProps(
//                 dropdownSearchDecoration: InputDecoration(
//                   hintText: inputHint,
//                   hintStyle: TextStyles.font14GreyRegular.copyWith(
//                     fontSize: 17.sp,
//                     color: const Color.fromARGB(
//                       77,
//                       77,
//                       77,
//                       1,
//                     ),
//                   ),
//                   fillColor: Colors.white,
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: ColorsManager.mainColor,
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(
//                       16,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: ColorsManager.mainColor,
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(
//                       16,
//                     ),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.red,
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(16.0),
//                   ),
//                   focusedErrorBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.red,
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(
//                       16.0,
//                     ),
//                   ),
//                   border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(
//                         20.0,
//                       ),
//                     ),
//                     borderSide: BorderSide(
//                       color: ColorsManager.mainColor,
//                       width: 1.3,
//                     ),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 12,
//                     horizontal: 10,
//                   ),
//                   suffixIcon: const Icon(
//                     Icons.arrow_drop_down,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               onChanged: (e) {
//                 // selectedItem = e;
//                 TransactionCubit.get(context).changeTheSelectedItem(e);
//               },
//               selectedItem: TransactionCubit.get(context).selectedItem,
//             )
//           ],
//         );
//       },
//     );
//   }
// }
