import 'package:eye_care/Core/networking/api_error_model.dart' show ApiErrorModel;
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_results.freezed.dart';

@Freezed()
abstract class ApiResults <T>with _$ApiResults<T>{

  const factory ApiResults.success(T data)=Success<T>;
  
  const factory ApiResults.failure(ApiErrorModel apiErrorModel)=Failure<T>;
}
