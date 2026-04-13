import 'package:dio/dio.dart';
import 'package:ems/data/network/api_clint.dart';
import 'package:ems/data/network/api_endpoint.dart';
import 'package:flutter/cupertino.dart';

class ApiServices {
  static Future<Response?> getAllInfo() async {
    final ApiClint clint = ApiClint();
    try {
      final Response response = await clint.dio.get(ApiEndpoint.employees);
      return response;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionError:
          debugPrint("No internet connection. Showing cached data.");
          break;
        case DioExceptionType.connectionTimeout:
          debugPrint("Connection Time out. Please try again");
          break;
        case DioExceptionType.receiveTimeout:
          debugPrint("Request timed out. Please try again.");
          break;
        case DioExceptionType.badResponse:
          debugPrint(
            "Server error (${e.response?.statusCode}).  Please try again.",
          );
          break;
        default:
          debugPrint("Something went wrong. Please try again.");
      }
    }
  }
}
