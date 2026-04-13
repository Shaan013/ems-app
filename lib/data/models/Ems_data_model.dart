  import 'Data.dart';
import 'dart:convert';

EmsDataModel emsDataModelFromJson(String str) => EmsDataModel.fromJson(json.decode(str));
String emsDataModelToJson(EmsDataModel data) => json.encode(data.toJson());
class EmsDataModel {
  EmsDataModel({
      String? status, 
      List<Data>? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  EmsDataModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  String? _status;
  List<Data>? _data;
  String? _message;

  String? get status => _status;
  List<Data>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}