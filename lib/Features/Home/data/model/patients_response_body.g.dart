// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientsResponseBody _$PatientsResponseBodyFromJson(
        Map<String, dynamic> json) =>
    PatientsResponseBody(
      results: (json['results'] as num?)?.toInt(),
      paginationresults: json['paginationresults'] == null
          ? null
          : PaginationResults.fromJson(
              json['paginationresults'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PatientData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientsResponseBodyToJson(
        PatientsResponseBody instance) =>
    <String, dynamic>{
      'results': instance.results,
      'paginationresults': instance.paginationresults,
      'data': instance.data,
    };

PaginationResults _$PaginationResultsFromJson(Map<String, dynamic> json) =>
    PaginationResults(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      currentPageLimit: (json['currentPageLimit'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationResultsToJson(PaginationResults instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'currentPageLimit': instance.currentPageLimit,
      'numberOfPages': instance.numberOfPages,
    };

PatientData _$PatientDataFromJson(Map<String, dynamic> json) => PatientData(
      id: json['_id'] as String?,
      report: (json['report'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      salutation: json['salutation'] as String?,
      ethnicity: json['ethnicity'] as String?,
      optician: json['optician'] == null
          ? null
          : Optician.fromJson(json['optician'] as Map<String, dynamic>),
      archivedByOptician: json['archivedByOptician'] as bool?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientDataToJson(PatientData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'report': instance.report,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'dateOfBirth': instance.dateOfBirth,
      'salutation': instance.salutation,
      'ethnicity': instance.ethnicity,
      'optician': instance.optician,
      'archivedByOptician': instance.archivedByOptician,
      'doctors': instance.doctors,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['_id'] as String?,
      modelResults: json['modelResults'] == null
          ? null
          : ModelResults.fromJson(json['modelResults'] as Map<String, dynamic>),
      doctorFeedbacks: (json['doctorFeedbacks'] as List<dynamic>?)
          ?.map((e) => DoctorFeedback.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      '_id': instance.id,
      'modelResults': instance.modelResults,
      'doctorFeedbacks': instance.doctorFeedbacks,
    };

ModelResults _$ModelResultsFromJson(Map<String, dynamic> json) => ModelResults(
      rightEye: json['rightEye'] == null
          ? null
          : EyeResults.fromJson(json['rightEye'] as Map<String, dynamic>),
      leftEye: json['leftEye'] == null
          ? null
          : EyeResults.fromJson(json['leftEye'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModelResultsToJson(ModelResults instance) =>
    <String, dynamic>{
      'rightEye': instance.rightEye,
      'leftEye': instance.leftEye,
    };

EyeResults _$EyeResultsFromJson(Map<String, dynamic> json) => EyeResults(
      cataract: json['Cataract'] == null
          ? null
          : Diagnosis.fromJson(json['Cataract'] as Map<String, dynamic>),
      diabeticRetinopathy: json['Diabetic Retinopathy'] == null
          ? null
          : Diagnosis.fromJson(
              json['Diabetic Retinopathy'] as Map<String, dynamic>),
      amd: json['Dursn (Age-related Macular Degeneration - AMD)'] == null
          ? null
          : Diagnosis.fromJson(
              json['Dursn (Age-related Macular Degeneration - AMD)']
                  as Map<String, dynamic>),
      glaucoma: json['Glaucoma'] == null
          ? null
          : Diagnosis.fromJson(json['Glaucoma'] as Map<String, dynamic>),
      eyeSide: json['eye_side'] as String?,
      imageQuality: json['image_quality'] == null
          ? null
          : ImageQuality.fromJson(
              json['image_quality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EyeResultsToJson(EyeResults instance) =>
    <String, dynamic>{
      'Cataract': instance.cataract,
      'Diabetic Retinopathy': instance.diabeticRetinopathy,
      'Dursn (Age-related Macular Degeneration - AMD)': instance.amd,
      'Glaucoma': instance.glaucoma,
      'eye_side': instance.eyeSide,
      'image_quality': instance.imageQuality,
    };

Diagnosis _$DiagnosisFromJson(Map<String, dynamic> json) => Diagnosis(
      confidence: (json['confidence'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DiagnosisToJson(Diagnosis instance) => <String, dynamic>{
      'confidence': instance.confidence,
      'status': instance.status,
    };

ImageQuality _$ImageQualityFromJson(Map<String, dynamic> json) => ImageQuality(
      confidence: (json['confidence'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ImageQualityToJson(ImageQuality instance) =>
    <String, dynamic>{
      'confidence': instance.confidence,
      'status': instance.status,
    };

DoctorFeedback _$DoctorFeedbackFromJson(Map<String, dynamic> json) =>
    DoctorFeedback(
      id: json['_id'] as String?,
      rightEyeFeedback: json['rightEyeFeedback'] == null
          ? null
          : EyeFeedback.fromJson(
              json['rightEyeFeedback'] as Map<String, dynamic>),
      leftEyeFeedback: json['leftEyeFeedback'] == null
          ? null
          : EyeFeedback.fromJson(
              json['leftEyeFeedback'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      readed: json['readed'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DoctorFeedbackToJson(DoctorFeedback instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rightEyeFeedback': instance.rightEyeFeedback,
      'leftEyeFeedback': instance.leftEyeFeedback,
      'doctor': instance.doctor,
      'readed': instance.readed,
      'createdAt': instance.createdAt,
    };

EyeFeedback _$EyeFeedbackFromJson(Map<String, dynamic> json) => EyeFeedback(
      aiPredictionCorrect: json['aiPredictionCorrect'] as String?,
      comment: json['comment'] as String?,
      diagnosis: json['diagnosis'] as String?,
      recommendedAction: json['recommendedAction'] as String?,
    );

Map<String, dynamic> _$EyeFeedbackToJson(EyeFeedback instance) =>
    <String, dynamic>{
      'aiPredictionCorrect': instance.aiPredictionCorrect,
      'comment': instance.comment,
      'diagnosis': instance.diagnosis,
      'recommendedAction': instance.recommendedAction,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: json['_id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      '_id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

DoctorAssignment _$DoctorAssignmentFromJson(Map<String, dynamic> json) =>
    DoctorAssignment(
      id: json['_id'] as String?,
      doctor: json['doctor'] as String?,
      archived: json['archived'] as bool?,
    );

Map<String, dynamic> _$DoctorAssignmentToJson(DoctorAssignment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'doctor': instance.doctor,
      'archived': instance.archived,
    };

Optician _$OpticianFromJson(Map<String, dynamic> json) => Optician(
      id: json['_id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$OpticianToJson(Optician instance) => <String, dynamic>{
      '_id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
