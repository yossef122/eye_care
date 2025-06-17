// lib/Features/Report/logic/report_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:eye_care/Features/patient_eye_examination_report/data/repo/report_repo.dart';
import 'package:eye_care/Features/patient_eye_examination_report/logic/report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit(this._reportRepo) : super(const ReportState.initial());
  final ReportRepo _reportRepo;

  Future<void> getReport(String reportId) async {
    emit(const ReportState.loading());
    final response = await _reportRepo.getReport(reportId);

    response.when(
      success: (reportResponse) {
        emit(ReportState.success(reportResponse));
      },
      failure: (apiErrorModel) {
        emit(ReportState.error(apiErrorModel));
      },
    );
  }

  Future<void> submitDoctorFeedback(
    String reportId,
    Map<String, dynamic> feedbackData,
  ) async {
    emit(const ReportState.loading());
    final response = await _reportRepo.submitDoctorFeedback(
      reportId,
      feedbackData,
    );

    response.when(
      success: (_) {
        emit(const ReportState.feedbackSubmitted());
      },
      failure: (apiErrorModel) {
        emit(ReportState.error(apiErrorModel));
      },
    );
  }
}
