import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClint {
  final Dio dio;
  
  ApiClint()
    : dio = Dio(
        BaseOptions(
          baseUrl: "https://dummy.restapiexample.com/api/v1",
          receiveTimeout: Duration(seconds: 10),
          connectTimeout: Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(PrettyDioLogger());
  }
}
