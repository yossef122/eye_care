// Updated PatientEyeExaminationReport with BlocBuilder
import 'package:eye_care/Features/patient_eye_examination_report/ui/widgets/patient_eye_examination_report_body.dart';
import 'package:eye_care/Features/patient_eye_examination_report/logic/report_cubit.dart';
import 'package:eye_care/Features/patient_eye_examination_report/logic/report_state.dart';
// import 'package:eye_care/Features/patient_eye_examination_report/data/model/report_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientEyeExaminationReport extends StatelessWidget {
  // final String reportId;

  const PatientEyeExaminationReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Eye Examination Report'),
      //   backgroundColor: Colors.blueAccent,
      //   foregroundColor: Colors.white,
      // ),
      body: SafeArea(
        child: BlocBuilder<ReportCubit, ReportState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Initializing...')),
              loading: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading report...'),
                  ],
                ),
              ),
              success: (reportResponse) {
                if (reportResponse.data == null) {
                  return const Center(child: Text('No report data available'));
                }
                return PatientEyeExaminationReportBody(
                  reportData: reportResponse.data!,
                );
              },
              error: (apiErrorModel) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      'Error loading report',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      apiErrorModel.getAllErrorMessages(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 16),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.read<ReportCubit>().getReport(widget.reportId);
                    //   },
                    //   child: Text('Retry'),
                    // ),
                  ],
                ),
              ),
              feedbackSubmitted: () {
                return SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
