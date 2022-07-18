import 'package:dio/dio.dart';
import 'package:magdsoft_internship_task/constants/end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //get data from the api
  static Future<Response> getData({
    required String method,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      method,
      queryParameters: query,
    );
  }

  //post data to the api
  static Future<Response> postData({
    required String method,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      method,
      data: data,
    );
  }
}
