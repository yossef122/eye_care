// import 'package:eye_care/Core/helpers/extensions.dart';
// import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Core/widgets/app_text_formField.dart';
import 'package:eye_care/Features/Home/data/model/patients_response_body.dart';
import 'package:eye_care/Features/Registration/Login/UI/widgets/login_body.dart';
import 'package:eye_care/Features/Home/Logic/cubit/home_cubit.dart';
import 'package:eye_care/Features/Home/Logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<String> headerText = [
    "id",
    "Name",
    "Date of Birth",
    "Salutation",
    "Ethnicity",
    "Reports Count",
    "Actions",
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Trigger the API call when the widget initializes
    context.read<HomeCubit>().getMyPatients();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MainText(),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.dehaze_sharp,
                          size: 40.w,
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Center(
                  child: Text(
                    "Patient List",
                    style: TextStyles.font24CyranBold,
                  ),
                ),
                SizedBox(height: 15.h),
                AppTextFormField(
                  controller: _searchController,
                  hintText: "Search",
                  hintStyle: TextStyles.font16BlackSemiBold,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManager.grey,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: ColorsManager.lighterGray,
                  // onChanged: (value) {
                  //   // Debounce search to avoid too many API calls
                  //   Future.delayed(Duration(milliseconds: 500), () {
                  //     if (_searchController.text == value) {
                  //       context.read<HomeCubit>().getMyPatients(keyword: value);
                  //     }
                  //   });
                  // },
                ),
                SizedBox(height: 15.h),
                ListOfPateints(headerText: headerText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListOfPateints extends StatelessWidget {
  const ListOfPateints({super.key, required this.headerText});

  final List<String> headerText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          getPatientloading: () => _buildLoadingState(),

          getPatientsuccess: (data) => _buildSuccessState(context, data),

          getPatienterror: (error) => _buildErrorState(context, error),

          orElse: () => _buildInitialState(),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return SizedBox(
      height: 400.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: ColorsManager.mainColor),
            SizedBox(height: 16.h),
            Text('Loading patients...', style: TextStyles.font16BlackSemiBold),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, PatientsResponseBody data) {
    final patients = data.data ?? [];

    if (patients.isEmpty) {
      return _buildEmptyState();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: Colors.grey, width: 1),
        columnWidths: {
          for (var i = 0; i < headerText.length; i++)
            i: FixedColumnWidth(150.h),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.blueGrey[100]),
            children: List.generate(
              headerText.length,
              (col) => Container(
                padding: EdgeInsets.all(12.r),
                constraints: BoxConstraints(minWidth: 150.w),
                child: Text(
                  headerText[col],
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ),
          ...List.generate(
            patients.length,
            (row) => TableRow(
              decoration: BoxDecoration(
                color: row.isOdd ? Colors.grey[50] : Colors.white,
              ),
              children: List.generate(
                headerText.length,
                (col) => _buildTableCell(context, patients[row], col, row),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableCell(
    BuildContext context,
    dynamic patient,
    int col,
    int row,
  ) {
    String cellData = '';

    switch (col) {
      case 0:
        cellData = patient.id?.toString() ?? '';
        break;
      case 1:
        cellData = "${patient.firstname} ${patient.lastname}";
        break;
      case 2:
        cellData = patient.dateOfBirth ?? '';
        break;
      case 3:
        cellData = patient.salutation ?? '';
        break;
      case 4:
        cellData = patient.ethnicity ?? '';
        break;
      case 5:
        cellData = "${patient.report.length}";
        break;
      case 6:
        return Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(minWidth: 150),
          child: IconButton(
            onPressed: () {
              context.pushNamed(
                Routes.patientReports,
                arguments: patient.id?.toString(),
              );
            },
            icon: Icon(
              Icons.visibility_outlined,
              color: ColorsManager.mainColor,
              size: 25.w,
            ),
          ),
        );
      default:
        cellData = '';
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      constraints: BoxConstraints(minWidth: 150.w),
      child: Text(
        cellData,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyles.font14BlackSemiBold,
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, dynamic error) {
    return SizedBox(
      height: 400.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 48.w),
            SizedBox(height: 16.h),
            Text('Error loading patients', style: TextStyles.font18BlackBold),
            SizedBox(height: 8.h),
            Text(
              error.getAllErrorMessages() ?? 'Unknown error occurred',
              style: TextStyles.font16BlackSemiBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().getMyPatients();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.mainColor,
              ),
              child: Text('Retry', style: TextStyles.font16WhiteSemiBold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return SizedBox(
      height: 400.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, color: Colors.grey, size: 48.w),
            SizedBox(height: 16.h),
            Text('No patients found', style: TextStyles.font18BlackBold),
            SizedBox(height: 8.h),
            Text(
              'There are no patients to display',
              style: TextStyles.font16CyanNormal.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return SizedBox(
      height: 400.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, color: Colors.grey, size: 48.w),
            SizedBox(height: 16.h),
            Text(
              'Ready to load patients',
              style: TextStyles.font16BlackSemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
