import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  String? status;
  DoctorData? data;
  String? token;

  LoginResponseBody({this.status, this.data, this.token});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

@JsonSerializable()
class DoctorData {
  DateOfBirth? dateOfBirth;
  @JsonKey(name: '_id')
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  @JsonKey(name: "Specialty")
  String? specialty;
  String? salutation;
  String? password;
  bool? licenseVerified;
  bool? active;
  String? role;
  String? state;
  String? city;
  String? fullAddress;
  String? postalCode;
  String? imagemedicallicense;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  bool? emailVerified;

  DoctorData({
    this.dateOfBirth,
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.specialty,
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
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
}

@JsonSerializable()
class DateOfBirth {
  int? day;
  String? month;
  int? year;

  DateOfBirth({this.day, this.month, this.year});

  factory DateOfBirth.fromJson(Map<String, dynamic> json) =>
      _$DateOfBirthFromJson(json);

  Map<String, dynamic> toJson() => _$DateOfBirthToJson(this);
}
