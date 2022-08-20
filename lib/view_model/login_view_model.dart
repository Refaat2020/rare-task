

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/core/service_locator.dart';
import 'package:rare_task/model/login_model.dart';
import 'package:rare_task/model/user_info_model.dart';
import 'package:rare_task/repositories/login_repo.dart';

import 'login_state.dart';


class LoginViewModel extends StateNotifier<LoginState>{
  LoginViewModel():super(LoginInitial());

  final LoginRepo _loginRepo = locator<LoginRepo>();
 String ?email;
 String ?password;
 UserInfoModel ?userInfoModel;
  Timer? timerToRefresh;

 Future<void> loginWithEmail() async {
   state = LoginLoading();
   LoginModel loginModel;
   loginModel = LoginModel(email!, password!);
   var response = await _loginRepo.loginCall(loginModel.toMap());
   if (response.runtimeType.toString() == "FailureModel") {
     state = LoginError(response.message);
   } else {
    userInfoModel = UserInfoModel.fromJson(response["data"]);
    start();
     state = LoginDone();
   }
 }

  start() async{
    timerToRefresh = Timer.periodic(const Duration(minutes:5), (timer) {
      getRefreshToken();
    });
  }

  Future getRefreshToken()async{
    Map<String, dynamic> refreshTokenBody = {
      "refresh_token":userInfoModel!.accessToken,
    };
    var response = await _loginRepo.refreshToken(refreshTokenBody);
    userInfoModel!.accessToken = response["refresh_token"];
  }
}

