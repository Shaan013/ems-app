import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? employeeName, 
      String? employeeSalary, 
      String? employeeAge, 
      String? profileImage,}){
    _id = id;
    _employeeName = employeeName;
    _employeeSalary = employeeSalary;
    _employeeAge = employeeAge;
    _profileImage = profileImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _employeeName = json['employee_name'];
    _employeeSalary = json['employee_salary'];
    _employeeAge = json['employee_age'];
    _profileImage = json['profile_image'];
  }
  int? _id;
  String? _employeeName;
  String? _employeeSalary;
  String? _employeeAge;
  String? _profileImage;

  int? get id => _id;
  String? get employeeName => _employeeName;
  String? get employeeSalary => _employeeSalary;
  String? get employeeAge => _employeeAge;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['employee_name'] = _employeeName;
    map['employee_salary'] = _employeeSalary;
    map['employee_age'] = _employeeAge;
    map['profile_image'] = _profileImage;
    return map;
  }

}