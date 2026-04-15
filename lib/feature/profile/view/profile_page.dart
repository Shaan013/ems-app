import 'package:ems/data/demo_data/demo_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  final int id;

  const ProfilePage({super.key, required this.id});


  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).headlineProfile)),
      body: Center(
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: .center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.network(
                DemoStrings.profileUrl,
                fit: .cover,
                height: 100.r,
                width: 100.r,
              ),
            ),
            Chip(label: Text("Project Manager", style: textTheme.titleMedium)),
            buildFiledData(textTheme, key: "Name", value: "Shaan")

          ],
        ),
      ),
    );
  }
  Widget buildFiledData(TextTheme textTheme ,{required String key , required String value}){
    return Text("${key} : $value",style: textTheme.titleMedium,);
  }
}
