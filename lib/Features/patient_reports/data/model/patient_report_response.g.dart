// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientReportResponse _$PatientReportResponseFromJson(
        Map<String, dynamic> json) =>
    PatientReportResponse(
      data: json['data'] == null
          ? null
          : PatientReportData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientReportResponseToJson(
        PatientReportResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PatientReportData _$PatientReportDataFromJson(Map<String, dynamic> json) =>
    PatientReportData(
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
      v: (json['__v'] as num?)?.toInt(),
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientReportDataToJson(PatientReportData instance) =>
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
      '__v': instance.v,
      'reports': instance.reports,
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

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      history: json['history'] == null
          ? null
          : History.fromJson(json['history'] as Map<String, dynamic>),
      eyeExamination: json['eyeExamination'] == null
          ? null
          : EyeExamination.fromJson(
              json['eyeExamination'] as Map<String, dynamic>),
      modelResults: json['modelResults'] == null
          ? null
          : ModelResults.fromJson(json['modelResults'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      patient: json['patient'] as String?,
      optician: json['optician'] as String?,
      doctorFeedbacks: (json['doctorFeedbacks'] as List<dynamic>?)
          ?.map((e) => DoctorFeedback.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'history': instance.history,
      'eyeExamination': instance.eyeExamination,
      'modelResults': instance.modelResults,
      '_id': instance.id,
      'patient': instance.patient,
      'optician': instance.optician,
      'doctorFeedbacks': instance.doctorFeedbacks,
      'createdAt': instance.createdAt,
      '__v': instance.v,
    };

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      medical: (json['medical'] as List<dynamic>?)
          ?.map((e) => MedicalCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      eye: (json['eye'] as List<dynamic>?)
          ?.map((e) => MedicalCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'medical': instance.medical,
      'eye': instance.eye,
    };

MedicalCondition _$MedicalConditionFromJson(Map<String, dynamic> json) =>
    MedicalCondition(
      name: json['name'] as String?,
      hasCondition: json['hasCondition'] as bool?,
      appliesTo: json['appliesTo'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$MedicalConditionToJson(MedicalCondition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hasCondition': instance.hasCondition,
      'appliesTo': instance.appliesTo,
      '_id': instance.id,
    };

EyeExamination _$EyeExaminationFromJson(Map<String, dynamic> json) =>
    EyeExamination(
      rightEye: json['rightEye'] == null
          ? null
          : EyeDetails.fromJson(json['rightEye'] as Map<String, dynamic>),
      leftEye: json['leftEye'] == null
          ? null
          : EyeDetails.fromJson(json['leftEye'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EyeExaminationToJson(EyeExamination instance) =>
    <String, dynamic>{
      'rightEye': instance.rightEye,
      'leftEye': instance.leftEye,
    };

EyeDetails _$EyeDetailsFromJson(Map<String, dynamic> json) => EyeDetails(
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      visusCC: json['visusCC'] as String?,
      previousValue: json['previousValue'] as String?,
      since: json['since'],
      sphere: json['sphere'] as String?,
      cylinder: json['cylinder'] as String?,
      axis: json['axis'] as String?,
      intraocularPressure: json['intraocularPressure'] as String?,
      imageCaptureDate: json['imageCaptureDate'] as String?,
      cornealThickness: json['cornealThickness'] as String?,
      chamberAngle: json['chamberAngle'] as String?,
      amslerTestAbnormal: json['amslerTestAbnormal'] as bool?,
    );

Map<String, dynamic> _$EyeDetailsToJson(EyeDetails instance) =>
    <String, dynamic>{
      'images': instance.images,
      'visusCC': instance.visusCC,
      'previousValue': instance.previousValue,
      'since': instance.since,
      'sphere': instance.sphere,
      'cylinder': instance.cylinder,
      'axis': instance.axis,
      'intraocularPressure': instance.intraocularPressure,
      'imageCaptureDate': instance.imageCaptureDate,
      'cornealThickness': instance.cornealThickness,
      'chamberAngle': instance.chamberAngle,
      'amslerTestAbnormal': instance.amslerTestAbnormal,
    };

ModelResults _$ModelResultsFromJson(Map<String, dynamic> json) => ModelResults(
      rightEye: ModelResults._parseEyeResults(json['rightEye']),
      leftEye: ModelResults._parseEyeResults(json['leftEye']),
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
