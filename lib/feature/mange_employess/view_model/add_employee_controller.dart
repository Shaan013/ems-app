import 'package:ems/data/models/Data.dart';
import 'package:flutter/material.dart';

class AddEmployeeController {
  final formKey = GlobalKey<FormState>();
  final isEdit = false;
  final employeeName = TextEditingController();
  final salary = TextEditingController();
  final age = TextEditingController();

  // Fill controllers from a Model
  void fillFromModel(Data model) {
    employeeName.text = model.employeeName!;
    salary.text = model.employeeSalary!;
    age.text = model.employeeAge!;
  }

  // Extract a Model from controllers
  Data toModel() {
    return Data(
      employeeName: this.employeeName.text,
      employeeSalary: this.salary.text,
      employeeAge: this.age.text,
    );
  }


  Future<void> handleTrySubmit(BuildContext context) async {
    // debugPrint(" i am in handle try submit ");
    final res = this.formKey.currentState!.validate();
    print("res: $res");
    if (res) {
      print("isEdit :$isEdit");
      if (isEdit == true) {
        debugPrint("in try ");
      } else {
        debugPrint("in try false ");
      }
      Navigator.pop(context, false);
    }
  }

  // Dispose all to prevent memory leaks
  void dispose() {
    employeeName.dispose();
    salary.dispose();
    age.dispose();
  }
}
