import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'patient_report_response.g.dart';

@JsonSerializable()
class PatientReportResponse {
  final PatientReportData? data;

  PatientReportResponse({this.data});

  factory PatientReportResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientReportResponseToJson(this);
}

@JsonSerializable()
class PatientReportData {
  @JsonKey(name: '_id')
  final String? id;
  final List<Report>? report;
  final String? firstname;
  final String? lastname;
  final String? dateOfBirth;
  final String? salutation;
  final String? ethnicity;
  final Optician? optician;
  final bool? archivedByOptician;
  final List<DoctorAssignment>? doctors;
  @JsonKey(name: '__v')
  final int? v;
  final List<Report>? reports;

  PatientReportData({
    this.id,
    this.report,
    this.firstname,
    this.lastname,
    this.dateOfBirth,
    this.salutation,
    this.ethnicity,
    this.optician,
    this.archivedByOptician,
    this.doctors,
    this.v,
    this.reports,
  });

  factory PatientReportData.fromJson(Map<String, dynamic> json) =>
      _$PatientReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$PatientReportDataToJson(this);
}

@JsonSerializable()
class Optician {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstname;
  final String? lastname;

  Optician({this.id, this.firstname, this.lastname});

  factory Optician.fromJson(Map<String, dynamic> json) =>
      _$OpticianFromJson(json);

  Map<String, dynamic> toJson() => _$OpticianToJson(this);
}

@JsonSerializable()
class DoctorAssignment {
  @JsonKey(name: '_id')
  final String? id;
  final String? doctor;
  final bool? archived;

  DoctorAssignment({this.id, this.doctor, this.archived});

  factory DoctorAssignment.fromJson(Map<String, dynamic> json) =>
      _$DoctorAssignmentFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAssignmentToJson(this);
}

@JsonSerializable()
class Report {
  final History? history;
  final EyeExamination? eyeExamination;
  final ModelResults? modelResults;
  @JsonKey(name: '_id')
  final String? id;
  final String? patient;
  final String? optician;
  final List<DoctorFeedback>? doctorFeedbacks;
  final String? createdAt;
  @JsonKey(name: '__v')
  final int? v;

  Report({
    this.history,
    this.eyeExamination,
    this.modelResults,
    this.id,
    this.patient,
    this.optician,
    this.doctorFeedbacks,
    this.createdAt,
    this.v,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class History {
  final List<MedicalCondition>? medical;
  final List<MedicalCondition>? eye;

  History({this.medical, this.eye});

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable()
class MedicalCondition {
  final String? name;
  final bool? hasCondition;
  final String? appliesTo;
  @JsonKey(name: '_id')
  final String? id;

  MedicalCondition({this.name, this.hasCondition, this.appliesTo, this.id});

  factory MedicalCondition.fromJson(Map<String, dynamic> json) =>
      _$MedicalConditionFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalConditionToJson(this);
}

@JsonSerializable()
class EyeExamination {
  final EyeDetails? rightEye;
  final EyeDetails? leftEye;

  EyeExamination({this.rightEye, this.leftEye});

  factory EyeExamination.fromJson(Map<String, dynamic> json) =>
      _$EyeExaminationFromJson(json);

  Map<String, dynamic> toJson() => _$EyeExaminationToJson(this);
}

@JsonSerializable()
class EyeDetails {
  final List<String>? images;
  final String? visusCC;
  final String? previousValue;
  final dynamic since;
  final String? sphere;
  final String? cylinder;
  final String? axis;
  final String? intraocularPressure;
  final String? imageCaptureDate;
  final String? cornealThickness;
  final String? chamberAngle;
  final bool? amslerTestAbnormal;

  EyeDetails({
    this.images,
    this.visusCC,
    this.previousValue,
    this.since,
    this.sphere,
    this.cylinder,
    this.axis,
    this.intraocularPressure,
    this.imageCaptureDate,
    this.cornealThickness,
    this.chamberAngle,
    this.amslerTestAbnormal,
  });

  factory EyeDetails.fromJson(Map<String, dynamic> json) =>
      _$EyeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$EyeDetailsToJson(this);
}

@JsonSerializable()
class ModelResults {
  @JsonKey(name: 'rightEye', fromJson: _parseEyeResults)
  final EyeResults? rightEye;
  @JsonKey(name: 'leftEye', fromJson: _parseEyeResults)
  final EyeResults? leftEye;

  ModelResults({this.rightEye, this.leftEye});

  factory ModelResults.fromJson(Map<String, dynamic> json) =>
      _$ModelResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelResultsToJson(this);

  static EyeResults? _parseEyeResults(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      try {
        return EyeResults.fromJson(json.decode(value));
      } catch (e) {
        print('Error parsing eye results: $e');
        return null;
      }
    } else if (value is Map<String, dynamic>) {
      return EyeResults.fromJson(value);
    }
    return null;
  }
}

@JsonSerializable()
class EyeResults {
  @JsonKey(name: 'Cataract')
  final Diagnosis? cataract;
  @JsonKey(name: 'Diabetic Retinopathy')
  final Diagnosis? diabeticRetinopathy;
  @JsonKey(name: 'Dursn (Age-related Macular Degeneration - AMD)')
  final Diagnosis? amd;
  @JsonKey(name: 'Glaucoma')
  final Diagnosis? glaucoma;
  @JsonKey(name: 'eye_side')
  final String? eyeSide;
  @JsonKey(name: 'image_quality')
  final ImageQuality? imageQuality;

  EyeResults({
    this.cataract,
    this.diabeticRetinopathy,
    this.amd,
    this.glaucoma,
    this.eyeSide,
    this.imageQuality,
  });

  factory EyeResults.fromJson(Map<String, dynamic> json) =>
      _$EyeResultsFromJson(json);

  Map<String, dynamic> toJson() => _$EyeResultsToJson(this);
}

@JsonSerializable()
class Diagnosis {
  final double? confidence;
  final String? status;

  Diagnosis({this.confidence, this.status});

  factory Diagnosis.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnosisToJson(this);
}

@JsonSerializable()
class ImageQuality {
  final double? confidence;
  final String? status;

  ImageQuality({this.confidence, this.status});

  factory ImageQuality.fromJson(Map<String, dynamic> json) =>
      _$ImageQualityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageQualityToJson(this);
}

@JsonSerializable()
class DoctorFeedback {
  @JsonKey(name: '_id')
  final String? id;
  final EyeFeedback? rightEyeFeedback;
  final EyeFeedback? leftEyeFeedback;
  final Doctor? doctor;
  final bool? readed;
  final String? createdAt;

  DoctorFeedback({
    this.id,
    this.rightEyeFeedback,
    this.leftEyeFeedback,
    this.doctor,
    this.readed,
    this.createdAt,
  });

  factory DoctorFeedback.fromJson(Map<String, dynamic> json) =>
      _$DoctorFeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorFeedbackToJson(this);
}

@JsonSerializable()
class EyeFeedback {
  final String? aiPredictionCorrect;
  final String? comment;
  final String? diagnosis;
  final String? recommendedAction;

  EyeFeedback({
    this.aiPredictionCorrect,
    this.comment,
    this.diagnosis,
    this.recommendedAction,
  });

  factory EyeFeedback.fromJson(Map<String, dynamic> json) =>
      _$EyeFeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$EyeFeedbackToJson(this);
}

@JsonSerializable()
class Doctor {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstname;
  final String? lastname;

  Doctor({this.id, this.firstname, this.lastname});

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}