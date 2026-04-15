import 'package:ems/core/widgets/message_snack_bar.dart';
import 'package:ems/data/models/Data.dart';
import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/data/network/repository/home_repository.dart';
import 'package:flutter/material.dart';

class AddEmployeeController {
  final formKey = GlobalKey<FormState>();
  bool isEdit = false;
  final employeeName = TextEditingController();
  final salary = TextEditingController();
  final age = TextEditingController();

  // Fill controllers from a Model
  void fillFromModel(Data model) {
    employeeName.text = model.employeeName!;
    salary.text = model.employeeSalary!;
    age.text = model.employeeAge!;
    isEdit = true;
  }

  // Extract a Model from controllers
  Data toModel() {
    return Data(
      employeeName: employeeName.text,
      employeeSalary: salary.text,
      employeeAge: age.text,
    );
  }

  Future<void> addNewDate() async {
    debugPrint("add new Date from Add employee page ");
    HomeRepository.addEmployee(data: toModel());
  }

  Future<void> upDateData() async {
    debugPrint("add new Date from Add employee page ");
    // HomeRepository.addEmployee(data: toModel());
  }

  void _showSnankBar(BuildContext context, EmsDataModel? res) {
    if (res?.status == "success") {
      messageSnackBar(context, message: res!.message.toString());
      Navigator.pop(context, false);
    } else {
      messageSnackBar(context, message: "Some thing want wrong");
    }
  }

  Future<void> handleTrySubmit(BuildContext context) async {
    // debugPrint(" i am in handle try submit ");
    final res = formKey.currentState!.validate();
    // print("res: $res");
    if (res) {
      // print("isEdit :$isEdit");
      if (isEdit == true) {
        try {
          final apiRes = await HomeRepository.upDateEmployee(toModel());
          _showSnankBar(context, apiRes);
        } catch (e) {
          messageSnackBar(context, message: e.toString());
        }
      } else {
        try {
          final apiRes = await HomeRepository.addEmployee(data: toModel());
          _showSnankBar(context, apiRes);
        }catch (e){
          messageSnackBar(context, message: e.toString());
        }
      }
    }
  }

  // Dispose all to prevent memory leaks
  void dispose() {
    employeeName.dispose();
    salary.dispose();
    age.dispose();
  }
}
