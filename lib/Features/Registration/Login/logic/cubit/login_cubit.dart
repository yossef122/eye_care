import 'package:bloc/bloc.dart';
import 'package:eye_care/Core/helpers/cach_helper.dart';
import 'package:eye_care/Core/helpers/constants.dart';
import 'package:eye_care/Core/helpers/shared_key.dart';
import 'package:eye_care/Core/networking/api_error_model.dart';
import 'package:eye_care/Core/networking/dio_factory.dart';
import 'package:eye_care/Features/Registration/Login/data/model/login_request_body.dart';
import 'package:eye_care/Features/Registration/Login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepo _loginRepo;

  bool? isObsecured = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  changeObsercure() {
    isObsecured = !isObsecured!;
    emit(LoginState.changeObsecureState(isObsecured: isObsecured ?? true));
  }

  emitLogin(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(
      success: (loginResonse) async {
        print("loginResonse.token! ${loginResonse.token!}");
        await saveUserToken(loginResonse.token!);
        emit(LoginState.loginSuccess(loginResonse));
      },
      failure: (apiErrorModel) {
        // print("error cubit");

        emit(LoginState.loginError(apiErrorModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await CachHelper.setSecuredString(key: SharedKeys.userToken, value: token);
    AppConstants.isLogged = true;
    DioFactory.setTokenAfterLogin(token);
  }
}
