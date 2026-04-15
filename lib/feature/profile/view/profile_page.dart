import 'package:ems/data/demo_data/demo_strings.dart';
import 'package:ems/data/mobx/profile_store.dart';
import 'package:ems/data/models/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/generated/l10n.dart';

class ProfilePage extends StatefulWidget {
  final int id;

  const ProfilePage({super.key, required this.id});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileStore profile;

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profile = ProfileStore();
    profile.fetchUser(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).headlineProfile)),
      body: Observer(builder: (_) => buildBody(context, profile: profile)),
    );
  }

  Widget buildBody(BuildContext context, {required ProfileStore profile}) {
    if (profile.isLoading) {
      return SizedBox(
        height: (0.8).sh,
        // width: (1).sw,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (profile.hasError) {
      return SizedBox(
        height: (0.8).sh,
        child: Center(
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: .center,
            children: [
              Text(profile.errorMessage.toString()),
              ElevatedButton(
                onPressed: () => profile.fetchUser(widget.id),
                child: Text(S.of(context).lblRefresh),
              ),
            ],
          ),
        ),
      );
    }
    if (profile.isSuccess) {
      final textTheme = TextTheme.of(context);
      final Data? profileData = profile.date.value?.data?.first;
      return Center(
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
            buildFiledData(
              textTheme,
              key: S.of(context).alblNme,
              value: profileData!.employeeName ?? "Unknow",
            ),
            buildFiledData(
              textTheme,
              key: S.of(context).lblAge,
              value: profileData.employeeAge ?? "Unknow",
            ),
            buildFiledData(
              textTheme,
              key: S.of(context).lblSalary,
              value: profileData.employeeSalary ?? "Unknow",
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  Widget buildFiledData(
    TextTheme textTheme, {
    required String key,
    required String value,
  }) {
    return Text("${key} : $value", style: textTheme.titleMedium);
  }
}
