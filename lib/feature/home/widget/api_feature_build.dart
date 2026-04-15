import 'package:ems/core/widgets/alert_dailog.dart';
import 'package:ems/core/widgets/message_snack_bar.dart';
import 'package:ems/data/models/Data.dart';
import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/data/network/repository/home_repository.dart';
import 'package:ems/feature/home/widget/address_card.dart';
import 'package:ems/feature/mange_employess/view/add_employes.dart';
import 'package:ems/feature/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/generated/l10n.dart';

class ApiFeatureBuild extends StatelessWidget {
  final Future future;

  const ApiFeatureBuild({super.key, required this.future});

  Future<void> handleDeleteEmployee(BuildContext context, int id) async {
    final EmsDataModel? res = await HomeRepository.deleteEmployeeById(id: id);
    messageSnackBar(
      context,
      message:
          res?.message ??
          S.of(context).errorYourDateIsNotDeletePleaseTryAgainLater,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SizedBox(
              height: (0.8).sh,
              child: Center(
                child: Text(
                  snapshot.error.toString().replaceFirst("Exception:", ""),
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: (0.8).sh,
              width: (0.9).sw,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData || snapshot.data == null) {
            Center(child: Text("date empty"));
          }
          final EmsDataModel data = snapshot.data;
          debugPrint("date receive ");
          final List<Data> listData;
          if (data.data == null) {
            listData = [];
          } else {
            listData = data.data!;
          }
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: listData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Data res = listData[index];
              return AddressCard(
                address:
                    "Name : ${res.employeeName} \nsalary : ${res.employeeSalary} \nAge : ${res.employeeAge ?? 0}",
                onDelete: () => alertDailog(
                  context,
                  message: S.of(context).msmDoYouReallyWantToDeleteEmployee,
                  onAgree: () {
                    handleDeleteEmployee(context, res.id!);
                  },
                ),
                onContextTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(id: res.id!),
                    ),
                  );
                },
                onEdit: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEmployeePage(data: res),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
