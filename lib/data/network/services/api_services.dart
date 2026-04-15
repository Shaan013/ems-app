import 'package:dio/dio.dart';
import 'package:ems/data/models/Data.dart';
import 'package:ems/data/network/api_clint.dart';
import 'package:ems/data/network/api_endpoint.dart';
import 'package:flutter/cupertino.dart';

class ApiServices {
  static void _dioExceptionSwitch(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        // debugPrint("No internet connection. Showing cached data.");
        throw Exception("No internet connection. Showing cached data.");
      case DioExceptionType.connectionTimeout:
        debugPrint("Connection Time out. Please try again");
        throw Exception("Connection Time out. Please try again");
        break;
      case DioExceptionType.receiveTimeout:
        debugPrint("Request timed out. Please try again.");
        throw Exception("Request timed out. Please try again.");
        break;
      case DioExceptionType.badResponse:
        debugPrint(
          "Server error (${e.response?.statusCode}).  Please try again.",
        );
        throw Exception(
          "Server error (${e.response?.statusCode}).  Please try again.",
        );
        break;
      default:
        throw Exception("Something went wrong. Please try again.");
        debugPrint("Something went wrong. Please try again.");
    }
  }

  static Future<Response?> getAllInfo() async {
    final ApiClint clint = ApiClint();
    try {
      final Response response = await clint.dio.get(ApiEndpoint.employees);
      return response;
    } on DioException catch (e) {
      _dioExceptionSwitch(e);
    }
  }

  // fuction for delect user or employees
  static Future<Response?> delectEmployees({required int id}) async {
    final ApiClint apiClint = ApiClint();
    try {
      final Response response = await apiClint.dio.delete(
        "${ApiEndpoint.delete}/$id",
      );
      return response;
    } on DioException catch (e) {
      _dioExceptionSwitch(e);
    } catch (e) {
      throw Exception("some think want wrong ${e} ");
    }
  }

  static Future<Response?> addEmployee({required Data date}) async {
    final ApiClint apiClint = ApiClint();
    try {
      final Response response = await apiClint.dio.post(
        ApiEndpoint.create,
        data: date.toJson(),
      );
    } on DioException catch (e) {
      _dioExceptionSwitch(e);
    } catch (e) {
      throw Exception("some think want wrong ${e} ");
    }
    return null;
  }

  static Future<Response?> updateEmpoyeeData(Data data) async {
    final ApiClint apiClint = ApiClint();
    try {
      return await apiClint.dio.put(
        ApiEndpoint.updateEmployee,
        data: data.toJson(),
      );
    } on DioException catch (e) {
      _dioExceptionSwitch(e);
    } catch (e) {
      throw Exception("some think want wrong ${e} ");
    }
    return null;
  }

  static Future<Response?> fetchEmployeeDatabyId(int id) async {
    final ApiClint apiClint = ApiClint();
    try {
      return await apiClint.dio.get("${ApiEndpoint.employees}/$id");
    } on DioException catch (e) {
      _dioExceptionSwitch(e);
    } catch (e) {
      throw "some thing want to wrong ";
    }
  }
}
