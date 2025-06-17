// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : DoctorData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'token': instance.token,
    };

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateOfBirth.fromJson(json['dateOfBirth'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      specialty: json['Specialty'] as String?,
      salutation: json['salutation'] as String?,
      password: json['password'] as String?,
      licenseVerified: json['licenseVerified'] as bool?,
      active: json['active'] as bool?,
      role: json['role'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      fullAddress: json['fullAddress'] as String?,
      postalCode: json['postalCode'] as String?,
      imagemedicallicense: json['imagemedicallicense'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
      emailVerified: json['emailVerified'] as bool?,
    );

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth,
      '_id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'Specialty': instance.specialty,
      'salutation': instance.salutation,
      'password': instance.password,
      'licenseVerified': instance.licenseVerified,
      'active': instance.active,
      'role': instance.role,
      'state': instance.state,
      'city': instance.city,
      'fullAddress': instance.fullAddress,
      'postalCode': instance.postalCode,
      'imagemedicallicense': instance.imagemedicallicense,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'emailVerified': instance.emailVerified,
    };

DateOfBirth _$DateOfBirthFromJson(Map<String, dynamic> json) => DateOfBirth(
      day: (json['day'] as num?)?.toInt(),
      month: json['month'] as String?,
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DateOfBirthToJson(DateOfBirth instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };
