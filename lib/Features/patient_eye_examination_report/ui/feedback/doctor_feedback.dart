import 'package:eye_care/Core/di/dependency_injection.dart';
import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eye_care/Features/patient_eye_examination_report/data/model/report_response.dart';
import 'package:eye_care/Features/patient_eye_examination_report/logic/report_cubit.dart';
import 'package:eye_care/Features/patient_eye_examination_report/logic/report_state.dart';

class DoctorFeedbackScreen extends StatelessWidget {
  final ReportData reportData;

  const DoctorFeedbackScreen({super.key, required this.reportData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReportCubit>(),
      child: DoctorFeedbackView(reportData: reportData),
    );
  }
}

class DoctorFeedbackView extends StatefulWidget {
  final ReportData reportData;

  const DoctorFeedbackView({super.key, required this.reportData});

  @override
  State<DoctorFeedbackView> createState() => _DoctorFeedbackViewState();
}

class _DoctorFeedbackViewState extends State<DoctorFeedbackView> {
  // Right Eye Controllers
  String? rightEyeAiPredictionCorrect;
  final TextEditingController rightEyeCommentController =
      TextEditingController();
  final TextEditingController rightEyeDiagnosisController =
      TextEditingController();
  final TextEditingController rightEyeRecommendedActionController =
      TextEditingController();

  // Left Eye Controllers
  String? leftEyeAiPredictionCorrect;
  final TextEditingController leftEyeCommentController =
      TextEditingController();
  final TextEditingController leftEyeDiagnosisController =
      TextEditingController();
  final TextEditingController leftEyeRecommendedActionController =
      TextEditingController();

  final List<String> feedbackOptions = ['Correct', 'Not Correct'];

  @override
  void dispose() {
    rightEyeCommentController.dispose();
    rightEyeDiagnosisController.dispose();
    rightEyeRecommendedActionController.dispose();
    leftEyeCommentController.dispose();
    leftEyeDiagnosisController.dispose();
    leftEyeRecommendedActionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Doctor\'s Feedback Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<ReportCubit, ReportState>(
        listener: (context, state) {
          state.when(
            loading: () {},
            success: (_) {},
            error: (apiErrorModel) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(apiErrorModel.message ?? 'An error occurred'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            feedbackSubmitted: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Feedback submitted successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigate back after successful submission
              Future.delayed(const Duration(seconds: 1), () {
                context.pop();
              });
            },
            initial: () {},
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPatientSummary(),
              SizedBox(height: 20.h),
              _buildRightEyeFeedbackForm(),
              SizedBox(height: 20.h),
              _buildLeftEyeFeedbackForm(),
              SizedBox(height: 30.h),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientSummary() {
    final patient = widget.reportData.patient;
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue.shade700, size: 24.sp),
                SizedBox(width: 8.w),
                Text(
                  'Patient Information',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              'Name: ${patient?.firstname ?? ''} ${patient?.lastname ?? ''}'
                      .trim()
                      .isEmpty
                  ? 'N/A'
                  : '${patient?.firstname ?? ''} ${patient?.lastname ?? ''}',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4.h),
            Text(
              'ID: ${patient?.id ?? 'N/A'}',
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'Examination Date: ${widget.reportData.createdAt != null ? _formatDate(widget.reportData.createdAt!) : 'N/A'}',
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightEyeFeedbackForm() {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.visibility,
                  color: Colors.green.shade700,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Right Eye Feedback',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Right Eye AI Prediction Feedback
            _buildSectionTitle('AI Prediction Correct?'),
            SizedBox(height: 8.h),
            _buildDropdownField(
              value: rightEyeAiPredictionCorrect,
              items: feedbackOptions,
              hint: 'Select...',
              onChanged: (value) {
                setState(() {
                  rightEyeAiPredictionCorrect = value;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Right Eye Comment
            _buildSectionTitle('Comment'),
            SizedBox(height: 8.h),
            _buildTextAreaField(
              controller: rightEyeCommentController,
              hint: 'Enter your comment about the right eye',
              maxLines: 3,
            ),
            SizedBox(height: 16.h),

            // Right Eye Diagnosis
            _buildSectionTitle('Diagnosis'),
            SizedBox(height: 8.h),
            _buildTextAreaField(
              controller: rightEyeDiagnosisController,
              hint: 'Enter diagnosis for right eye',
              maxLines: 3,
            ),
            SizedBox(height: 16.h),

            // Right Eye Recommended Action
            _buildSectionTitle('Recommended Action'),
            SizedBox(height: 8.h),
            _buildTextAreaField(
              controller: rightEyeRecommendedActionController,
              hint: 'Enter recommended action for right eye',
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftEyeFeedbackForm() {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.visibility,
                  color: Colors.blue.shade700,
                  size: 24.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Left Eye Feedback',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Left Eye AI Prediction Feedback
            _buildSectionTitle('AI Prediction Correct?'),
            SizedBox(height: 8.h),
            _buildDropdownField(
              value: leftEyeAiPredictionCorrect,
              items: feedbackOptions,
              hint: 'Select...',
              onChanged: (value) {
                setState(() {
                  leftEyeAiPredictionCorrect = value;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Left Eye Comment
            _buildSectionTitle('Comment'),
            SizedBox(height: 8.h),
            _buildTextAreaField(
              controller: leftEyeCommentController,
              hint: 'Enter your comment about the left eye',
              maxLines: 3,
            ),
            SizedBox(height: 16.h),

            // Left Eye Diagnosis
            _buildSectionTitle('Diagnosis'),
            SizedBox(height: 8.h),
            _buildTextAreaField(
              controller: leftEyeDiagnosisController,
              hint: 'Enter diagnosis for left eye',
              maxLines: 3,
            ),
            SizedBox(height: 16.h),

            // Left Eye Recommended Action
            _buildSectionTitle('Recommended Action'),
            SizedBox(height: 8.h),
            _buildTextAreaField(
              controller: leftEyeRecommendedActionController,
              hint: 'Enter recommended action for left eye',
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade800,
      ),
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required List<String> items,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
        dropdownColor: Colors.white,
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildTextAreaField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
        style: TextStyle(fontSize: 14.sp),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : () => _submitFeedback(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              elevation: 2,
            ),
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Submit Feedback',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
    );
  }

  void _submitFeedback(BuildContext context) {
    // Check if at least one eye has feedback
    bool hasRightEyeFeedback = _hasEyeFeedback(
      rightEyeAiPredictionCorrect,
      rightEyeCommentController.text,
      rightEyeDiagnosisController.text,
      rightEyeRecommendedActionController.text,
    );

    bool hasLeftEyeFeedback = _hasEyeFeedback(
      leftEyeAiPredictionCorrect,
      leftEyeCommentController.text,
      leftEyeDiagnosisController.text,
      leftEyeRecommendedActionController.text,
    );

    if (!hasRightEyeFeedback && !hasLeftEyeFeedback) {
      _showSnackBar(
        context,
        'Please provide feedback for at least one eye',
        Colors.red,
      );
      return;
    }

    // Create feedback data object matching backend structure
    final feedbackData = {
      'rightEyeFeedback': {
        'aiPredictionCorrect': rightEyeAiPredictionCorrect ?? '',
        'comment': rightEyeCommentController.text.trim(),
        'diagnosis': rightEyeDiagnosisController.text.trim(),
        'recommendedAction': rightEyeRecommendedActionController.text.trim(),
      },
      'leftEyeFeedback': {
        'aiPredictionCorrect': leftEyeAiPredictionCorrect ?? '',
        'comment': leftEyeCommentController.text.trim(),
        'diagnosis': leftEyeDiagnosisController.text.trim(),
        'recommendedAction': leftEyeRecommendedActionController.text.trim(),
      },
    };

    // Submit feedback using cubit
    context.read<ReportCubit>().submitDoctorFeedback(
      widget.reportData.id!,
      feedbackData,
    );
  }

  bool _hasEyeFeedback(
    String? aiPrediction,
    String comment,
    String diagnosis,
    String recommendedAction,
  ) {
    return (aiPrediction != null && aiPrediction.isNotEmpty) ||
        comment.trim().isNotEmpty ||
        diagnosis.trim().isNotEmpty ||
        recommendedAction.trim().isNotEmpty;
  }

  void _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }
}
// import 'package:eye_care/Core/di/dependency_injection.dart';
// import 'package:eye_care/Core/helpers/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:eye_care/Features/patient_eye_examination_report/data/model/report_response.dart';
// import 'package:eye_care/Features/patient_eye_examination_report/logic/report_cubit.dart';
// import 'package:eye_care/Features/patient_eye_examination_report/logic/report_state.dart';

// class DoctorFeedbackScreen extends StatelessWidget {
//   final ReportData reportData;

//   const DoctorFeedbackScreen({super.key, required this.reportData});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<ReportCubit>(),
//       child: DoctorFeedbackView(reportData: reportData),
//     );
//   }
// }

// class DoctorFeedbackView extends StatefulWidget {
//   final ReportData reportData;

//   const DoctorFeedbackView({super.key, required this.reportData});

//   @override
//   State<DoctorFeedbackView> createState() => _DoctorFeedbackViewState();
// }

// class _DoctorFeedbackViewState extends State<DoctorFeedbackView> {
//   String? rightEyePredictionFeedback;
//   String? leftEyePredictionFeedback;
//   final TextEditingController rightEyeCommentController =
//       TextEditingController();
//   final TextEditingController leftEyeCommentController =
//       TextEditingController();
//   final TextEditingController diagnosisController = TextEditingController();
//   final TextEditingController recommendedActionController =
//       TextEditingController();

//   final List<String> feedbackOptions = ['Correct', 'Not Correct'];

//   @override
//   void dispose() {
//     rightEyeCommentController.dispose();
//     leftEyeCommentController.dispose();
//     diagnosisController.dispose();
//     recommendedActionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//       appBar: AppBar(
//         title: const Text(
//           'Doctor\'s Feedback Form',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.green,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: BlocListener<ReportCubit, ReportState>(
//         listener: (context, state) {
//           state.when(
//             loading: () {},
//             success: (_) {},
//             error: (apiErrorModel) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(apiErrorModel.message ?? 'An error occurred'),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//             },
//             feedbackSubmitted: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Feedback submitted successfully!'),
//                   backgroundColor: Colors.green,
//                 ),
//               );
//               // Navigate to success screen or back
//               Future.delayed(const Duration(seconds: 1), () {
//                 context.pop();
//               });
//             },
//             initial: () {},
//           );
//         },
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildPatientSummary(),
//               SizedBox(height: 20.h),
//               _buildFeedbackForm(),
//               SizedBox(height: 30.h),
//               _buildSubmitButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPatientSummary() {
//     final patient = widget.reportData.patient;
//     return Card(
//       color: Colors.white,
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
//       child: Container(
//         padding: EdgeInsets.all(16.w),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12.r),
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade50, Colors.blue.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.person, color: Colors.blue.shade700, size: 24.sp),
//                 SizedBox(width: 8.w),
//                 Text(
//                   'Patient Information',
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue.shade700,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 12.h),
//             Text(
//               'Name: ${patient?.firstname ?? ''} ${patient?.lastname ?? ''}'
//                       .trim()
//                       .isEmpty
//                   ? 'N/A'
//                   : '${patient?.firstname ?? ''} ${patient?.lastname ?? ''}',
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 4.h),
//             Text(
//               'ID: ${patient?.id ?? 'N/A'}',
//               style: TextStyle(fontSize: 14.sp),
//             ),
//             SizedBox(height: 4.h),
//             Text(
//               'Examination Date: ${widget.reportData.createdAt != null ? _formatDate(widget.reportData.createdAt!) : 'N/A'}',
//               style: TextStyle(fontSize: 14.sp),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeedbackForm() {
//     return Card(
//       color: Colors.white,

//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
//       child: Padding(
//         padding: EdgeInsets.all(20.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.feedback, color: Colors.green.shade700, size: 24.sp),
//                 SizedBox(width: 8.w),
//                 Text(
//                   'Feedback Form',
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green.shade700,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20.h),

//             // Right Eye AI Prediction Feedback
//             _buildSectionTitle('Right Eye - AI Prediction Correct?'),
//             SizedBox(height: 8.h),
//             _buildDropdownField(
//               value: rightEyePredictionFeedback,
//               items: feedbackOptions,
//               hint: 'Select...',
//               onChanged: (value) {
//                 setState(() {
//                   rightEyePredictionFeedback = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16.h),

//             // Right Eye Comment
//             _buildSectionTitle('Right Eye Comment'),
//             SizedBox(height: 8.h),
//             _buildTextAreaField(
//               controller: rightEyeCommentController,
//               hint: 'Enter your opinion about the right eye prediction',
//               maxLines: 4,
//             ),
//             SizedBox(height: 20.h),

//             // Left Eye AI Prediction Feedback
//             _buildSectionTitle('Left Eye - AI Prediction Correct?'),
//             SizedBox(height: 8.h),
//             _buildDropdownField(
//               value: leftEyePredictionFeedback,
//               items: feedbackOptions,
//               hint: 'Select...',
//               onChanged: (value) {
//                 setState(() {
//                   leftEyePredictionFeedback = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16.h),

//             // Left Eye Comment
//             _buildSectionTitle('Left Eye Comment'),
//             SizedBox(height: 8.h),
//             _buildTextAreaField(
//               controller: leftEyeCommentController,
//               hint: 'Enter your opinion about the left eye prediction',
//               maxLines: 4,
//             ),
//             SizedBox(height: 20.h),

//             // Diagnosis
//             _buildSectionTitle('Diagnosis'),
//             SizedBox(height: 8.h),
//             _buildTextAreaField(
//               controller: diagnosisController,
//               hint: 'Enter your medical diagnosis',
//               maxLines: 4,
//             ),
//             SizedBox(height: 20.h),

//             // Recommended Action
//             _buildSectionTitle('Recommended Action'),
//             SizedBox(height: 8.h),
//             _buildTextAreaField(
//               controller: recommendedActionController,
//               hint: 'Suggested next steps for the patient',
//               maxLines: 4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w600,
//         color: Colors.grey.shade800,
//       ),
//     );
//   }

//   Widget _buildDropdownField({
//     required String? value,
//     required List<String> items,
//     required String hint,
//     required ValueChanged<String?> onChanged,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(8.r),
//         color: Colors.white,
//       ),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: TextStyle(color: Colors.grey.shade500),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.r),
//             borderSide: BorderSide.none,
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 16.w,
//             vertical: 12.h,
//           ),
//         ),
//         items: items.map((String item) {
//           return DropdownMenuItem<String>(value: item, child: Text(item));
//         }).toList(),
//         onChanged: onChanged,
//         dropdownColor: Colors.white,
//         icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
//       ),
//     );
//   }

//   Widget _buildTextAreaField({
//     required TextEditingController controller,
//     required String hint,
//     int maxLines = 1,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(8.r),
//         color: Colors.white,
//       ),
//       child: TextFormField(
//         controller: controller,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: TextStyle(color: Colors.grey.shade500),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.r),
//             borderSide: BorderSide.none,
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 16.w,
//             vertical: 12.h,
//           ),
//         ),
//         style: TextStyle(fontSize: 14.sp),
//       ),
//     );
//   }

//   Widget _buildSubmitButton() {
//     return BlocBuilder<ReportCubit, ReportState>(
//       builder: (context, state) {
//         final isLoading = state.maybeWhen(
//           loading: () => true,
//           orElse: () => false,
//         );

//         return SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: isLoading ? null : () => _submitFeedback(context),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//               foregroundColor: Colors.white,
//               padding: EdgeInsets.symmetric(vertical: 16.h),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               elevation: 2,
//             ),
//             child: isLoading
//                 ? const CircularProgressIndicator(color: Colors.white)
//                 : Text(
//                     'Submit Feedback',
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//           ),
//         );
//       },
//     );
//   }

//   void _submitFeedback(BuildContext context) {
//     // Validate required fields
//     if (rightEyePredictionFeedback == null ||
//         leftEyePredictionFeedback == null) {
//       _showSnackBar(
//         context,
//         'Please select feedback for both eyes',
//         Colors.red,
//       );
//       return;
//     }

//     if (diagnosisController.text.trim().isEmpty) {
//       _showSnackBar(context, 'Please provide a diagnosis', Colors.red);
//       return;
//     }

//     if (recommendedActionController.text.trim().isEmpty) {
//       _showSnackBar(context, 'Please provide recommended action', Colors.red);
//       return;
//     }

//     // Create feedback data object
//     final feedbackData = {
//       'reportId': widget.reportData.id,
//       'rightEyeFeedback': rightEyePredictionFeedback,
//       'rightEyeComment': rightEyeCommentController.text.trim(),
//       'leftEyeFeedback': leftEyePredictionFeedback,
//       'leftEyeComment': leftEyeCommentController.text.trim(),
//       'diagnosis': diagnosisController.text.trim(),
//       'recommendedAction': recommendedActionController.text.trim(),
//       'submittedAt': DateTime.now().toIso8601String(),
//     };

//     // Submit feedback using cubit
//     context.read<ReportCubit>().submitDoctorFeedback(
//       widget.reportData.id!,
//       feedbackData,
//     );
//   }

//   void _showSnackBar(
//     BuildContext context,
//     String message,
//     Color backgroundColor,
//   ) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: backgroundColor,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   String _formatDate(String dateString) {
//     try {
//       final date = DateTime.parse(dateString);
//       return '${date.day}/${date.month}/${date.year}';
//     } catch (e) {
//       return dateString;
//     }
//   }
// }
