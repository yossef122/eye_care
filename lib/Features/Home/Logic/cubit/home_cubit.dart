import 'package:bloc/bloc.dart';
import 'package:eye_care/Features/Home/Logic/cubit/home_state.dart';
import 'package:eye_care/Features/Home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._patientsRepo) : super(HomeState.initial());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PatientsRepo _patientsRepo;

  Future<void> getMyPatients({int? limit, String? keyword}) async {
    emit(const HomeState.getPatientloading());
    final response = await _patientsRepo.getMyPatients(
      limit: limit,
      keyword: keyword,
    );

    response.when(
      success: (patientsResponse) {
        emit(HomeState.getPatientsuccess(patientsResponse));
      },
      failure: (apiErrorModel) {
        emit(HomeState.getPatienterror(apiErrorModel));
      },
    );
  }

}
