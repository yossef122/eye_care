import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'report_response.g.dart';

@JsonSerializable()
class ReportResponse {
  final ReportData? data;

  ReportResponse({this.data});

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
}

@JsonSerializable()
class ReportData {
  final History? history;
  final EyeExamination? eyeExamination;
  final ModelResults? modelResults;
  @JsonKey(name: '_id')
  final String? id;
  final BasicPatient? patient;
  final BasicOptician? optician;
  final List<DoctorFeedback>? doctorFeedbacks;
  final String? createdAt;
  @JsonKey(name: '__v')
  final int? v;

  ReportData({
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

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataToJson(this);
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

// Simplified Patient model to avoid circular dependencies
@JsonSerializable()
class BasicPatient {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? dateOfBirth;
  final String? salutation;
  final String? ethnicity;

  BasicPatient({
    this.id,
    this.firstname,
    this.lastname,
    this.dateOfBirth,
    this.salutation,
    this.ethnicity,
  });

  factory BasicPatient.fromJson(Map<String, dynamic> json) =>
      _$BasicPatientFromJson(json);

  Map<String, dynamic> toJson() => _$BasicPatientToJson(this);
}

// Simplified Optician model
@JsonSerializable()
class BasicOptician {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstname;
  final String? lastname;

  BasicOptician({this.id, this.firstname, this.lastname});

  factory BasicOptician.fromJson(Map<String, dynamic> json) =>
      _$BasicOpticianFromJson(json);

  Map<String, dynamic> toJson() => _$BasicOpticianToJson(this);
}

// Full Optician model (used when needed separately)
@JsonSerializable()
class Optician {
  final DateOfBirth? dateOfBirth;
  @JsonKey(name: '_id')
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? salutation;
  final String? password;
  final bool? licenseVerified;
  final bool? active;
  final String? role;
  final String? state;
  final String? city;
  final String? fullAddress;
  final String? postalCode;
  final String? imagemedicallicense;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final bool? emailVerified;
  final String? imageProfile;

  Optician({
    this.dateOfBirth,
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.salutation,
    this.password,
    this.licenseVerified,
    this.active,
    this.role,
    this.state,
    this.city,
    this.fullAddress,
    this.postalCode,
    this.imagemedicallicense,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.emailVerified,
    this.imageProfile,
  });

  factory Optician.fromJson(Map<String, dynamic> json) =>
      _$OpticianFromJson(json);

  Map<String, dynamic> toJson() => _$OpticianToJson(this);
}

@JsonSerializable()
class DateOfBirth {
  final int? day;
  final String? month;
  final int? year;

  DateOfBirth({this.day, this.month, this.year});

  factory DateOfBirth.fromJson(Map<String, dynamic> json) =>
      _$DateOfBirthFromJson(json);

  Map<String, dynamic> toJson() => _$DateOfBirthToJson(this);
}

@JsonSerializable()
class DoctorFeedback {
  @JsonKey(name: '_id')
  final String? id;
  final EyeFeedback? rightEyeFeedback;
  final EyeFeedback? leftEyeFeedback;
  final BasicDoctor? doctor;
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

// Simplified Doctor model
@JsonSerializable()
class BasicDoctor {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstname;
  final String? lastname;

  BasicDoctor({this.id, this.firstname, this.lastname});

  factory BasicDoctor.fromJson(Map<String, dynamic> json) =>
      _$BasicDoctorFromJson(json);

  Map<String, dynamic> toJson() => _$BasicDoctorToJson(this);
}

// Doctor Assignment model
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
// // lib/Features/Report/data/model/report_response.dart
// import 'package:json_annotation/json_annotation.dart';

// part 'report_response.g.dart';

// @JsonSerializable()
// class ReportResponse {
//   ReportData? data;

//   ReportResponse({this.data});

//   factory ReportResponse.fromJson(Map<String, dynamic> json) =>
//       _$ReportResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
// }

// @JsonSerializable()
// class ReportData {
//   History? history;
//   EyeExamination? eyeExamination;
//   ModelResults? modelResults;
//   @JsonKey(name: '_id')
//   String? id;
//   Patient? patient;
//   Optician? optician;
//   List<dynamic>? doctorFeedbacks;
//   String? createdAt;
//   @JsonKey(name: '__v')
//   int? v;

//   ReportData({
//     this.history,
//     this.eyeExamination,
//     this.modelResults,
//     this.id,
//     this.patient,
//     this.optician,
//     this.doctorFeedbacks,
//     this.createdAt,
//     this.v,
//   });

//   factory ReportData.fromJson(Map<String, dynamic> json) =>
//       _$ReportDataFromJson(json);

//   Map<String, dynamic> toJson() => _$ReportDataToJson(this);
// }

// @JsonSerializable()
// class History {
//   List<MedicalCondition>? medical;
//   List<MedicalCondition>? eye;

//   History({this.medical, this.eye});

//   factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);

//   Map<String, dynamic> toJson() => _$HistoryToJson(this);
// }

// @JsonSerializable()
// class MedicalCondition {
//   String? name;
//   bool? hasCondition;
//   String? appliesTo;
//   @JsonKey(name: '_id')
//   String? id;

//   MedicalCondition({this.name, this.hasCondition, this.appliesTo, this.id});

//   factory MedicalCondition.fromJson(Map<String, dynamic> json) =>
//       _$MedicalConditionFromJson(json);

//   Map<String, dynamic> toJson() => _$MedicalConditionToJson(this);
// }

// @JsonSerializable()
// class EyeExamination {
//   EyeDetails? rightEye;
//   EyeDetails? leftEye;

//   EyeExamination({this.rightEye, this.leftEye});

//   factory EyeExamination.fromJson(Map<String, dynamic> json) =>
//       _$EyeExaminationFromJson(json);

//   Map<String, dynamic> toJson() => _$EyeExaminationToJson(this);
// }

// @JsonSerializable()
// class EyeDetails {
//   List<String>? images;
//   String? visusCC;
//   String? previousValue;
//   String? since;
//   String? sphere;
//   String? cylinder;
//   String? axis;
//   String? intraocularPressure;
//   String? imageCaptureDate;
//   String? cornealThickness;
//   String? chamberAngle;
//   bool? amslerTestAbnormal;

//   EyeDetails({
//     this.images,
//     this.visusCC,
//     this.previousValue,
//     this.since,
//     this.sphere,
//     this.cylinder,
//     this.axis,
//     this.intraocularPressure,
//     this.imageCaptureDate,
//     this.cornealThickness,
//     this.chamberAngle,
//     this.amslerTestAbnormal,
//   });

//   factory EyeDetails.fromJson(Map<String, dynamic> json) =>
//       _$EyeDetailsFromJson(json);

//   Map<String, dynamic> toJson() => _$EyeDetailsToJson(this);
// }

// @JsonSerializable()
// class ModelResults {
//   String? rightEye;
//   String? leftEye;

//   ModelResults({this.rightEye, this.leftEye});

//   factory ModelResults.fromJson(Map<String, dynamic> json) =>
//       _$ModelResultsFromJson(json);

//   Map<String, dynamic> toJson() => _$ModelResultsToJson(this);
// }

// @JsonSerializable()
// class Patient {
//   @JsonKey(name: '_id')
//   String? id;
//   List<String>? report;
//   String? firstname;
//   String? lastname;
//   String? dateOfBirth;
//   String? salutation;
//   String? ethnicity;
//   Optician? optician;
//   List<String>? doctors;
//   @JsonKey(name: '__v')
//   int? v;

//   Patient({
//     this.id,
//     this.report,
//     this.firstname,
//     this.lastname,
//     this.dateOfBirth,
//     this.salutation,
//     this.ethnicity,
//     this.optician,
//     this.doctors,
//     this.v,
//   });

//   factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

//   Map<String, dynamic> toJson() => _$PatientToJson(this);
// }

// @JsonSerializable()
// class Optician {
//   DateOfBirth? dateOfBirth;
//   @JsonKey(name: '_id')
//   String? id;
//   String? firstname;
//   String? lastname;
//   String? email;
//   String? salutation;
//   String? password;
//   bool? licenseVerified;
//   bool? active;
//   String? role;
//   String? state;
//   String? city;
//   String? fullAddress;
//   String? postalCode;
//   String? imagemedicallicense;
//   String? createdAt;
//   String? updatedAt;
//   @JsonKey(name: '__v')
//   int? v;
//   bool? emailVerified;
//   String? imageProfile;

//   Optician({
//     this.dateOfBirth,
//     this.id,
//     this.firstname,
//     this.lastname,
//     this.email,
//     this.salutation,
//     this.password,
//     this.licenseVerified,
//     this.active,
//     this.role,
//     this.state,
//     this.city,
//     this.fullAddress,
//     this.postalCode,
//     this.imagemedicallicense,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.emailVerified,
//     this.imageProfile,
//   });

//   factory Optician.fromJson(Map<String, dynamic> json) =>
//       _$OpticianFromJson(json);

//   Map<String, dynamic> toJson() => _$OpticianToJson(this);
// }

// @JsonSerializable()
// class DateOfBirth {
//   int? day;
//   String? month;
//   int? year;

//   DateOfBirth({this.day, this.month, this.year});

//   factory DateOfBirth.fromJson(Map<String, dynamic> json) =>
//       _$DateOfBirthFromJson(json);

//   Map<String, dynamic> toJson() => _$DateOfBirthToJson(this);
// }
