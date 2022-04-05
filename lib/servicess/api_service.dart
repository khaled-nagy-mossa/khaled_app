import 'package:dio/dio.dart';
import 'package:map_app_test/endPoints.dart';
import 'package:map_app_test/models/response_model.dart';

class ApiService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }
  factory ApiService() {
    return _apiUtil;
  }

  Dio dio = new Dio();

  void init() {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.connectTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: true,
    //   compact: true,
    // ));
  }

  Future<T?> request<T>(
    String endPoint,
    String method, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String contentType = "application/json",
    Function(String errorMsg)? errorDialog,
    Function(String successMsg)? onSuccess,
    Function(String errorMsg)? errorMessage,
  }) async {
    try {
      var headers = {"Authorization": "Bearer", "Accept-Language": "en"};
      Response response = await dio.request<T>(endPoint,
          data: data ?? {},
          queryParameters: queryParameters,
          options: Options(
            method: method,
            contentType: contentType,
            headers: headers,
          ));

      print("status: ${response.statusCode}");
      print("response is : $response");

      final dataModel = ResponseModel.fromJson(response.data);

      if (!dataModel.status || dataModel.data == null)
        throw "${dataModel.message}";
      if (onSuccess != null) {
        print('ApiService.request msg= ${dataModel.message}');
        // onSuccess(dataModel.message);
      }
      return dataModel.data;
    } catch (e) {
      // if (errorDialog == null && errorMessage == null) {
      //   await Get.defaultDialog(
      //     title: error.tr,
      //     content: Text("ERROR_HAPPENED".tr),
      //     middleText: "",
      //   );
      // }
      // if (errorDialog != null) {
      //   await errorDialog(e.toString());
      // }
      // if (errorMessage != null) {
      //   errorMessage(e.toString());
      // }
      return null;
    }
  }
}
