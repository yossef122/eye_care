import 'package:eye_care/Features/patient_reports/ui/widget/patient_reports_body.dart';
import 'package:flutter/material.dart';

class PatientReports extends StatelessWidget {
  const PatientReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SafeArea(child: PatientReportsBody()),
    );
  }
}
