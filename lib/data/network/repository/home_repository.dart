import 'package:dio/dio.dart';
import 'package:ems/data/models/Data.dart';
import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/data/network/services/api_services.dart';

class HomeRepository {
  // comen fuction for each process fuction
  static EmsDataModel? _convertToModel(Response? response) {
    if (response?.statusCode != 200 || response == null) {
      return null;
    }
    final fDate = EmsDataModel.fromJson(response.data);
    return fDate;
  }

  static Future<EmsDataModel?> getEmsData() async {
    final Response? response = await ApiServices.getAllInfo();
    return _convertToModel(response);
  }

  static Future<EmsDataModel?> deleteEmployeeById({required int id}) async {
    final Response? response = await ApiServices.delectEmployees(id: id);
    return _convertToModel(response);
  }

  static Future<EmsDataModel?> addEmployee({required Data data}) async {
    final Response? response = await ApiServices.addEmployee(date: data);
    // if (response?.statusCode != 200 || response == null) {
    //   return null;
    // }
    // final fDate = EmsDataModel.fromJson(response.data);
    // debugPrint("f date : ${fDate}");
    return _convertToModel(response);
  }

  static Future<EmsDataModel?> upDateEmployee(Data data) async {
    final Response? response = await ApiServices.updateEmpoyeeData(data);
    return _convertToModel(response);
  }

  static Future<EmsDataModel?> getEmployeeById(int id) async {
    final Response? response = await ApiServices.fetchEmployeeDatabyId(id);
    return _convertToModel(response);
  }
}
