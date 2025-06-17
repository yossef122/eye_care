import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'patients_response_body.g.dart';

@JsonSerializable()
class PatientsResponseBody {
  final int? results;
  final PaginationResults? paginationresults;
  final List<PatientData>? data;

  PatientsResponseBody({this.results, this.paginationresults, this.data});

  factory PatientsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$PatientsResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PatientsResponseBodyToJson(this);
}

@JsonSerializable()
class PaginationResults {
  final int? currentPage;
  final int? currentPageLimit;
  final int? numberOfPages;

  PaginationResults({
    this.currentPage,
    this.currentPageLimit,
    this.numberOfPages,
  });

  factory PaginationResults.fromJson(Map<String, dynamic> json) =>
      _$PaginationResultsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResultsToJson(this);
}

@JsonSerializable()
class PatientData {
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

  PatientData({
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
  });

  factory PatientData.fromJson(Map<String, dynamic> json) =>
      _$PatientDataFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDataToJson(this);
}

@JsonSerializable()
class Report {
  @JsonKey(name: '_id')
  final String? id;
  final ModelResults? modelResults;
  final List<DoctorFeedback>? doctorFeedbacks;

  Report({this.id, this.modelResults, this.doctorFeedbacks});

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class ModelResults {
  @JsonKey(name: "rightEye")
  final EyeResults? rightEye;
  @JsonKey(name: "leftEye")
  final EyeResults? leftEye;

  ModelResults({this.rightEye, this.leftEye});

  factory ModelResults.fromJson(Map<String, dynamic> json) {
    return ModelResults(
      rightEye: _parseEyeResults(json["rightEye"]),
      leftEye: _parseEyeResults(json["leftEye"]),
    );
  }

  Map<String, dynamic> toJson() => _$ModelResultsToJson(this);

  static EyeResults? _parseEyeResults(dynamic value) {
    if (value == null) return null;
    
    if (value is String) {
      try {
        final Map<String, dynamic> parsed = json.decode(value);
        return EyeResults.fromJson(parsed);
      } catch (e) {
        print("Failed to parse eye results: $e");
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