// Updated PatientReportsBody with BlocBuilder
import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Features/Registration/Login/UI/widgets/login_body.dart';
import 'package:eye_care/Features/patient_reports/logic/patient_report_cubit.dart';
import 'package:eye_care/Features/patient_reports/logic/patient_report_state.dart';
import 'package:eye_care/Features/patient_reports/data/model/patient_report_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientReportsBody extends StatelessWidget {
  const PatientReportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainText(),
          SizedBox(height: 15.h),
          Text("Patient Reports", style: TextStyles.font24CyranBold),
          SizedBox(height: 20.h),
          BlocBuilder<PatientReportCubit, PatientReportState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => SizedBox(
                  height: 300.h,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                success: (patientReportResponse) {
                  final reports = patientReportResponse.data?.reports ?? [];

                  if (reports.isEmpty) {
                    return SizedBox(
                      height: 300.h,
                      child: Center(
                        child: Text(
                          "No reports available",
                          style: TextStyles.font16BlackSemiBold,
                        ),
                      ),
                    );
                  }

                  return SizedBox(
                    height: 650.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final report = reports[index];
                        return InkWell(
                          child: PatientReportItem(report: report),
                          onTap: () {
                            context.pushNamed(
                              Routes.patientEyeExaminationReport,
                              arguments: report.id,
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10.h);
                      },
                      itemCount: reports.length,
                    ),
                  );
                },
                error: (apiErrorModel) => SizedBox(
                  height: 300.h,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48.r,
                          color: Colors.red,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Error loading reports",
                          style: TextStyles.font16BlackSemiBold,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          apiErrorModel.message ?? "Something went wrong",
                          style: TextStyles.font14LightGrayRegular,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<PatientReportCubit>()
                                .getPatientWithReport("patientId");
                          },
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Updated PatientReportItem to use actual data
class PatientReportItem extends StatelessWidget {
  final Report report;

  const PatientReportItem({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Report Date:", style: TextStyles.font16BlackSemiBold),
                SizedBox(width: 15.w),
                Text(
                  _formatDate(report.createdAt),
                  style: TextStyles.font14LightGrayRegular,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  "RightEye visusCC:",
                  style: TextStyles.font16BlackSemiBold,
                ),
                SizedBox(width: 15.w),
                Text(
                  report.eyeExamination?.rightEye?.visusCC ?? "N/A",
                  style: TextStyles.font14LightGrayRegular,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text("LeftEye visusCC:", style: TextStyles.font16BlackSemiBold),
                SizedBox(width: 15.w),
                Text(
                  report.eyeExamination?.leftEye?.visusCC ?? "N/A",
                  style: TextStyles.font14LightGrayRegular,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  "Model Prediction - Right Eye",
                  style: TextStyles.font16BlackSemiBold,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            _buildModelResults(
              report.modelResults?.rightEye!.imageQuality!.confidence
                  .toString(),
            ),

            if (report.modelResults?.leftEye != null) ...[
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "Model Prediction - Left Eye",
                    style: TextStyles.font16BlackSemiBold,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              _buildModelResults(
                report.modelResults?.leftEye!.imageQuality!.confidence
                    .toString(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildModelResults(String? modelResultsJson) {
    if (modelResultsJson == null || modelResultsJson.isEmpty) {
      return Text(
        "No model results available",
        style: TextStyles.font14LightGrayRegular,
      );
    }

    // Since modelResults is stored as String, you might need to parse it
    // This is a simplified version - you may need to adjust based on actual JSON structure
    return Column(
      children: [
        Row(
          children: [
            Text("Diabetic Retinopathy", style: TextStyles.font16BlackSemiBold),
            SizedBox(width: 15.w),
            Text("detected", style: TextStyles.font14LightGrayRegular),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text("Glaucoma", style: TextStyles.font16BlackSemiBold),
            SizedBox(width: 15.w),
            Text("detected", style: TextStyles.font14LightGrayRegular),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text("Cataract", style: TextStyles.font16BlackSemiBold),
            SizedBox(width: 15.w),
            Text("detected", style: TextStyles.font14LightGrayRegular),
          ],
        ),
      ],
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return "N/A";

    try {
      final date = DateTime.parse(dateString);
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    } catch (e) {
      return dateString;
    }
  }
}
