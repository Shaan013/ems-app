import 'package:dio/dio.dart';
import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/data/network/api_services.dart';

class HomeRepository {
  static Future<EmsDataModel?> getEmsData() async {
    final Response? response = await ApiServices.getAllInfo();
    if (response?.statusCode != 200 || response == null) {
      return null;
    }

    final EmsDataModel dataModel = EmsDataModel.fromJson(response.data);
    return dataModel;
  }
}
