import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future get({required String endPoint}) async {
    Response response = await _dio.get(endPoint);
    return response.data;
  }
}
