import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  Future<List> get({required String endpoint}) async {
    Response response = await _dio.get(endpoint);
    List<dynamic> responseData = response.data;
    return responseData;
  }
}
