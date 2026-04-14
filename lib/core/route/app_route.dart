import 'package:ems/feature/home/view/home_page.dart';
import 'package:ems/feature/mange_employess/view/add_employes.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static final home = "/";
  static final addEmployee = "/employee/add";

  static Map<String, WidgetBuilder> getRouteMap = {
    home: (context) => HomePage(),
    addEmployee: (context) => AddEmployeePage(),
  };
}
