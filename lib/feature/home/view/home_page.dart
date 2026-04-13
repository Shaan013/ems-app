import 'package:ems/data/models/Ems_data_model.dart';
import 'package:ems/data/repository/home_repository.dart';
import 'package:ems/feature/home/widget/api_feature_build.dart';
import 'package:flutter/material.dart';

import '../../../utils/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<EmsDataModel?> eData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eData = getuserData();
    debugPrint("e data (home page) : ${eData}");
  }

  Future<EmsDataModel?> getuserData() async {
    return await HomeRepository.getEmsData();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).titleTeamDirectory,
          style: textTheme.titleLarge,
        ),
      ),
      body: ApiFeatureBuild(future: eData),
    );
  }
}
