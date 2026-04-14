import 'package:ems/data/models/Data.dart';
import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/feature/home/widget/address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApiFeatureBuild extends StatelessWidget {
  final Future future;

  // final Widget child;

  const ApiFeatureBuild({
    super.key,
    required this.future,
    // required this.child,
  });

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
              final res = listData[index];
              return AddressCard(
                address:
                    "Name : ${res.employeeName} \nsalary : ${res.employeeSalary} \nAge : ${res.employeeAge ?? 0}",
              );
            },
          );
        },
      ),
    );
  }
}
