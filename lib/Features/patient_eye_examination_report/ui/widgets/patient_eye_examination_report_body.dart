import 'dart:convert';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Features/Registration/Login/UI/widgets/login_body.dart';
import 'package:eye_care/Features/patient_eye_examination_report/data/model/report_response.dart';
import 'package:eye_care/Features/patient_eye_examination_report/ui/feedback/doctor_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientEyeExaminationReportBody extends StatelessWidget {
  final ReportData reportData;

  const PatientEyeExaminationReportBody({super.key, required this.reportData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(child: MainText()),
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPatientInformation(),
              _buildMedicalHistory(),
              _buildEyeHistory(),
              _buildRightEyeExamination(),
              _buildLeftEyeExamination(),
              _buildUploadedEyeImages(),
              _buildModelPredictionRightEye(),
              _buildModelPredictionLeftEye(),
              _buildFeedbackButton(context), // Added feedback button
            ],
          ),
        ],
      ),
    );
  }

  // New method for feedback button
  Widget _buildFeedbackButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DoctorFeedbackScreen(reportData: reportData),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.feedback, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              'Send feedback',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInformation() {
    final patient = reportData.patient;
    return SectionCard(
      title: 'Patient Information',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
            label: 'Name',
            value:
                '${patient?.firstname ?? ''} ${patient?.lastname ?? ''}'
                    .trim()
                    .isEmpty
                ? 'N/A'
                : '${patient?.firstname ?? ''} ${patient?.lastname ?? ''}',
          ),
          InfoRow(label: 'Salutation', value: patient?.salutation ?? 'N/A'),
          InfoRow(label: 'Ethnicity', value: patient?.ethnicity ?? 'N/A'),
          InfoRow(label: 'ID', value: patient?.id ?? 'N/A'),
          InfoRow(label: 'Date of Birth', value: patient?.dateOfBirth ?? 'N/A'),
          InfoRow(
            label: 'Date Of Examination',
            value: reportData.createdAt != null
                ? _formatDate(reportData.createdAt!)
                : 'N/A',
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalHistory() {
    final medicalHistory = reportData.history?.medical ?? [];

    return SectionCard(
      title: 'Medical History',
      child: medicalHistory.isEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 8.0.h),
              child: Text(
                'No medical history available.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : Column(
              children: medicalHistory.map((condition) {
                return MedicalConditionRow(
                  condition: condition.name ?? 'Unknown',
                  hasCondition: condition.hasCondition ?? false,
                  appliesTo: condition.appliesTo ?? 'N/A',
                );
              }).toList(),
            ),
    );
  }

  Widget _buildEyeHistory() {
    final eyeHistory = reportData.history?.eye ?? [];

    return SectionCard(
      title: 'Eye History',
      child: eyeHistory.isEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 8.0.h),
              child: Text(
                'No eye history available.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : Column(
              children: eyeHistory.map((condition) {
                return MedicalConditionRow(
                  condition: condition.name ?? 'Unknown',
                  hasCondition: condition.hasCondition ?? false,
                  appliesTo: condition.appliesTo ?? 'N/A',
                );
              }).toList(),
            ),
    );
  }

  Widget _buildRightEyeExamination() {
    final rightEye = reportData.eyeExamination?.rightEye;

    return SectionCard(
      title: 'Right Eye Examination',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(label: 'Visus (CC)', value: rightEye?.visusCC ?? 'N/A'),
          InfoRow(
            label: 'Previous Value',
            value: rightEye?.previousValue ?? 'N/A',
          ),
          InfoRow(label: 'Since', value: rightEye?.since ?? 'N/A'),
          InfoRow(label: 'Sphere', value: rightEye?.sphere ?? 'N/A'),
          InfoRow(label: 'Cylinder', value: rightEye?.cylinder ?? 'N/A'),
          InfoRow(label: 'Axis', value: rightEye?.axis ?? 'N/A'),
          InfoRow(
            label: 'Intraocular Pressure',
            value: rightEye?.intraocularPressure ?? 'N/A',
          ),
          InfoRow(
            label: 'Corneal Thickness',
            value: rightEye?.cornealThickness ?? 'N/A',
          ),
          InfoRow(
            label: 'Chamber Angle',
            value: rightEye?.chamberAngle ?? 'N/A',
          ),
          InfoRow(
            label: 'Amsler Test Abnormal',
            value: rightEye?.amslerTestAbnormal != null
                ? (rightEye!.amslerTestAbnormal! ? 'Yes' : 'No')
                : 'N/A',
          ),
        ],
      ),
    );
  }

  Widget _buildLeftEyeExamination() {
    final leftEye = reportData.eyeExamination?.leftEye;

    return SectionCard(
      title: 'Left Eye Examination',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(label: 'Visus (CC)', value: leftEye?.visusCC ?? 'N/A'),
          InfoRow(
            label: 'Previous Value',
            value: leftEye?.previousValue ?? 'N/A',
          ),
          InfoRow(label: 'Since', value: leftEye?.since ?? 'N/A'),
          InfoRow(label: 'Sphere', value: leftEye?.sphere ?? 'N/A'),
          InfoRow(label: 'Cylinder', value: leftEye?.cylinder ?? 'N/A'),
          InfoRow(label: 'Axis', value: leftEye?.axis ?? 'N/A'),
          InfoRow(
            label: 'Intraocular Pressure',
            value: leftEye?.intraocularPressure ?? 'N/A',
          ),
          InfoRow(
            label: 'Corneal Thickness',
            value: leftEye?.cornealThickness ?? 'N/A',
          ),
          InfoRow(
            label: 'Chamber Angle',
            value: leftEye?.chamberAngle ?? 'N/A',
          ),
          InfoRow(
            label: 'Amsler Test Abnormal',
            value: leftEye?.amslerTestAbnormal != null
                ? (leftEye!.amslerTestAbnormal! ? 'Yes' : 'No')
                : 'N/A',
          ),
        ],
      ),
    );
  }

  Widget _buildUploadedEyeImages() {
    final rightEyeImages = reportData.eyeExamination?.rightEye?.images ?? [];
    final leftEyeImages = reportData.eyeExamination?.leftEye?.images ?? [];

    return InkWell(
      onTap: () {
        print(
          "http://75.119.150.159:8000/funds/LeftEye-634a1830-dc4d-4d70-a9bf-3aa28c0042ba-1749680413711-0.jpeg",
        );
      },
      child: SectionCard(
        title: 'Uploaded Eye Images',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Right Eye', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            rightEyeImages.isEmpty
                ? Text('No images available')
                : Column(
                    children: rightEyeImages.map((imageUrl) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error, color: Colors.red),
                                    Text('Failed to load image'),
                                  ],
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
            SizedBox(height: 16.h),
            Text('Left Eye', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            leftEyeImages.isEmpty
                ? Text('No images available')
                : Column(
                    children: leftEyeImages.map((imageUrl) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error, color: Colors.red),
                                    Text('Failed to load image'),
                                  ],
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildModelPredictionRightEye() {
    final rightEyeResult = reportData.modelResults?.rightEye;

    return SectionCard(
      title: 'AI Analysis - Right Eye',
      child: rightEyeResult == null
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
              child: Center(
                child: Text(
                  'No AI analysis available for right eye.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            )
          : _buildModelResultsTable(rightEyeResult),
    );
  }

  Widget _buildModelPredictionLeftEye() {
    final leftEyeResult = reportData.modelResults?.leftEye;

    return SectionCard(
      title: 'AI Analysis - Left Eye',
      child: leftEyeResult == null
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
              child: Center(
                child: Text(
                  'No AI analysis available for left eye.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            )
          : _buildModelResultsTable(leftEyeResult),
    );
  }

  List<Map<String, dynamic>> _parseModelResults(EyeResults eyeResult) {
    List<Map<String, dynamic>> diseases = [];

    // Helper function to add disease if detected
    void addDiseaseIfDetected(String name, Diagnosis? diagnosis) {
      if (diagnosis != null &&
          diagnosis.status == 'Detected' &&
          diagnosis.confidence != null) {
        diseases.add({
          'name': name,
          'percentage': (diagnosis.confidence! * 100).round(),
          'status': diagnosis.status!,
          'detected': true,
        });
      }
    }

    // Check each diagnosis
    addDiseaseIfDetected('Cataract', eyeResult.cataract);
    addDiseaseIfDetected('Diabetic Retinopathy', eyeResult.diabeticRetinopathy);
    addDiseaseIfDetected(
      'Age-related Macular Degeneration (AMD)',
      eyeResult.amd,
    );
    addDiseaseIfDetected('Glaucoma', eyeResult.glaucoma);

    // Sort diseases by confidence percentage in descending order
    diseases.sort(
      (a, b) => (b['percentage'] as int).compareTo(a['percentage'] as int),
    );

    return diseases;
  }

  // Alternative version to show all diseases (detected and not detected)
  List<Map<String, dynamic>> _parseModelResultsAll(EyeResults eyeResult) {
    List<Map<String, dynamic>> diseases = [];

    // Helper function to add disease
    void addDisease(String name, Diagnosis? diagnosis) {
      final bool isDetected = diagnosis?.status == 'Detected';
      final int confidencePercentage = diagnosis?.confidence != null
          ? (diagnosis!.confidence! * 100).round()
          : 0;

      diseases.add({
        'name': name,
        'percentage': confidencePercentage,
        'status': diagnosis?.status ?? 'Unknown',
        'detected': isDetected,
      });
    }

    // Add all diseases
    addDisease('Cataract', eyeResult.cataract);
    addDisease('Diabetic Retinopathy', eyeResult.diabeticRetinopathy);
    addDisease('Age-related Macular Degeneration (AMD)', eyeResult.amd);
    addDisease('Glaucoma', eyeResult.glaucoma);

    // Sort by detected status first, then by confidence
    diseases.sort((a, b) {
      if (a['detected'] && !b['detected']) return -1;
      if (!a['detected'] && b['detected']) return 1;
      return (b['percentage'] as int).compareTo(a['percentage'] as int);
    });

    return diseases;
  }

  Widget _buildModelResultsTable(EyeResults eyeResult) {
    // Use _parseModelResultsAll to show both detected and not detected diseases
    // Or use _parseModelResults to show only detected diseases
    final diseases = _parseModelResultsAll(eyeResult); // Changed to show all

    if (diseases.isEmpty) {
      return Container(
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.grey.shade400,
                size: 32.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                'No disease predictions available.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          // Image Quality Section (if available)
          if (eyeResult.imageQuality != null) ...[
            _buildImageQualitySection(eyeResult.imageQuality!),
            SizedBox(height: 16.h),
          ],

          // Table Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: Colors.blue.shade100),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Condition',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.blue.shade700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'AI Confidence',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.blue.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Table Rows
          ...diseases.asMap().entries.map((entry) {
            final index = entry.key;
            final disease = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == diseases.length - 1 ? 0 : 8.h,
              ),
              child: _buildDiseaseRow(
                disease['name'],
                disease['percentage'],
                detected: disease['detected'],
                status: disease['status'],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildImageQualitySection(ImageQuality imageQuality) {
    final bool isGoodQuality =
        imageQuality.status == 'Good' || imageQuality.status == 'Excellent';
    final Color qualityColor = isGoodQuality ? Colors.green : Colors.orange;
    final IconData qualityIcon = isGoodQuality
        ? Icons.check_circle_outline
        : Icons.warning_outlined;

    final int confidencePercentage = imageQuality.confidence != null
        ? (imageQuality.confidence! * 100).round()
        : 0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: qualityColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: qualityColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(qualityIcon, color: qualityColor, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'Image Quality: ${imageQuality.status ?? 'Unknown'}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                // color: qualityColor.shade700,
              ),
            ),
          ),
          if (confidencePercentage > 0)
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
              decoration: BoxDecoration(
                color: qualityColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '${confidencePercentage / 100}%',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  // color: qualityColor.shade700,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDiseaseRow(
    String diseaseName,
    int percentage, {
    String? status,
    bool? detected,
  }) {
    Color getPercentageColor(int percentage, bool isDetected) {
      if (!isDetected) return Colors.grey.shade500;
      if (percentage >= 80) return Colors.red.shade600;
      if (percentage >= 60) return Colors.orange.shade600;
      if (percentage >= 40) return Colors.amber.shade600;
      return Colors.green.shade600;
    }

    IconData getStatusIcon(bool isDetected) {
      return isDetected ? Icons.warning_rounded : Icons.check_circle_outline;
    }

    final bool isDetected = detected ?? (percentage > 0);
    final Color color = getPercentageColor(percentage, isDetected);
    final IconData statusIcon = getStatusIcon(isDetected);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDetected ? color.withOpacity(0.3) : Colors.grey.shade300,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8.r),
        color: isDetected ? color.withOpacity(0.05) : Colors.grey.shade50,
      ),
      child: Row(
        children: [
          // Status Icon
          Container(
            margin: EdgeInsets.only(right: 8.w),
            child: Icon(statusIcon, color: color, size: 20.sp),
          ),
          // Disease Name
          Expanded(
            flex: 3,
            child: Text(
              diseaseName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isDetected ? Colors.black87 : Colors.grey.shade600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Confidence Badge
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: color.withOpacity(0.4), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isDetected) ...[
                    Text(
                      '${percentage / 100}%',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Not Detected',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final DateTime dateTime = DateTime.parse(dateString);
      return '${dateTime.day}.${dateTime.month}.${dateTime.year}';
    } catch (e) {
      return dateString;
    }
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            width: double.infinity,
            child: Text(title, style: TextStyles.font18WhiteBold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: child,
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0.h),
      child: RichText(
        text: TextSpan(
          style: TextStyles.font14BlackSemiBold,
          children: [
            TextSpan(text: '$label: ', style: TextStyles.font18BlackBold),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class MedicalConditionRow extends StatelessWidget {
  final String condition;
  final bool hasCondition;
  final String appliesTo;

  const MedicalConditionRow({
    super.key,
    required this.condition,
    required this.hasCondition,
    required this.appliesTo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                condition,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                'Has: ${hasCondition ? "Yes" : "No"}',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text('Applies: $appliesTo', textAlign: TextAlign.center),
            ),
          ],
        ),
      ],
    );
  }
}
