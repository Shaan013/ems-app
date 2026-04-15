import 'package:ems/data/models/Data.dart';
import 'package:ems/feature/mange_employess/view_model/add_employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_validation.dart';
import '../../../core/theme/app_edge_insets.dart';
import '../../../core/theme/app_input_decoration.dart';
import '../../../utils/generated/l10n.dart';
import '../wigets/elevated_button_full_width.dart';

class AddEmployeePage extends StatefulWidget {
  final Data? data;

  const AddEmployeePage({super.key, this.data});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  late final AddEmployeeController _addEmployeeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addEmployeeController = AddEmployeeController();
    if (widget.data != null) {
      _addEmployeeController.fillFromModel(widget.data!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          !_addEmployeeController.isEdit
              ? S.of(context).headingAddNewEmployee
              : S.of(context).headlineEditEmployeeData,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  autovalidateMode: .onUserInteraction,
                  key: _addEmployeeController.formKey,
                  child: Padding(
                    padding: AppEdgeInsets.m,
                    child: Column(
                      spacing: 18.r,
                      children: [
                        TextFormField(
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _addEmployeeController.employeeName,
                          textInputAction: .next,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).lblEmployeeName,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _addEmployeeController.age,
                          textInputAction: .next,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).lblEmployeeAge,
                          ),
                        ),

                        TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _addEmployeeController.salary,
                          textInputAction: .done,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).lblEmployeeSalary,
                          ),
                        ),
                        40.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: .bottomCenter,
            child: Padding(
              padding: AppEdgeInsets.m,
              child: fullWidthButton(
                context,
                text: !_addEmployeeController.isEdit
                    ? S.of(context).lblAdd
                    : S.of(context).lblUpdate,
                onTap: () => _addEmployeeController.handleTrySubmit(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
