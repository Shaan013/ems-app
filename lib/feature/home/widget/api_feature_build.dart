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
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Data Not Found"));
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
        final data = snapshot.data;
        // final List<> article = data?.articles ?? [];
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return AddressCard(address: "shaan");
          },
        );
      },
    );
  }
}
