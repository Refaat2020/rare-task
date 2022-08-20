import 'package:dio/dio.dart';

import '../model/failure_model.dart';
import 'dio_options.dart';


class DioServices {
  Dio dio = Dio();

  Future <dynamic>postRequest(Map<String, dynamic> body, String apiUrl) async {
    dio.options = await DioConfigOptions.getBaseOption();
    Response response = await dio.post(apiUrl,
        data:  body);
    final Map<String, dynamic> responseBody = response.data;

    if (response.statusCode == 200 || response.statusCode == 201) {
      return responseBody;
    } else {
      FailureModel failureModel;
      failureModel = FailureModel.fromJson(responseBody);

      return failureModel;
    }
  }


}
