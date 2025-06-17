// lib/Features/PatientReport/logic/patient_report_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:eye_care/Features/patient_reports/data/repo/patient_report_repo.dart';
import 'package:eye_care/Features/patient_reports/logic/patient_report_state.dart';


class PatientReportCubit extends Cubit<PatientReportState> {
  PatientReportCubit(this._patientReportRepo) : super(const PatientReportState.initial());
  final PatientReportRepo _patientReportRepo;

  Future<void> getPatientWithReport(String patientId) async {
    emit(const PatientReportState.loading());
    final response = await _patientReportRepo.getPatientWithReport(patientId);

    response.when(
      success: (patientReportResponse) {
        emit(PatientReportState.success(patientReportResponse));
      },
      failure: (apiErrorModel) {
        emit(PatientReportState.error(apiErrorModel));
      },
    );
  }
}