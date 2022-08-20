import 'package:rare_task/model/user_info_model.dart';

import '../constant/url_constant.dart';
import '../core/dio_services.dart';
import '../core/service_locator.dart';

class LoginRepo{

  final DioServices _dioServices = locator<DioServices>();
  //99b61c71fba8174d

  Future loginCall(Map<String,dynamic>loginBody)async{
    var response  = await _dioServices.postRequest(loginBody, UrlConstant.postLogin);
    return response;
  }

  Future refreshToken(Map<String,dynamic>loginBody)async{
    var response  = await _dioServices.postRequest(loginBody, UrlConstant.postRefreshToken);
    return response;
  }
}