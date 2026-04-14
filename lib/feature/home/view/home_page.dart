import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/feature/home/widget/api_feature_build.dart';
import 'package:ems/feature/mange_employess/view/add_employes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/network/repository/home_repository.dart';
import '../../../utils/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<EmsDataModel?> getuserData() async {
    return await HomeRepository.getEmsData();
  }

  Future<void> refresh() async {
    setState(() {});
    await Duration(seconds: 1);
    return;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        onPressed: goToAddPage,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          S.of(context).titleTeamDirectory,
          style: textTheme.titleLarge,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ApiFeatureBuild(future: getuserData()),
        ),
      ),
    );
  }

  void goToAddPage() {
    debugPrint("next page");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEmployee()),
    );
  }
}
