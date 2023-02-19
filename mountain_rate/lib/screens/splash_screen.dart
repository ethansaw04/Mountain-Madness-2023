import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mountain_rate/screens/selection_screen.dart';

import '../models/mountain_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<MountainModel> list = List.empty(growable: true);
  int current_index = 0;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Expanded(child: Image.asset("assets/images/mount_everest.jpg")),
      ),
    );
  }

  startTime() async {
    readJSON().then((value) {
      Timer(const Duration(seconds: 3), () => route(value));
    });
  }

  route(models) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SelectionScreen(modelList: models)));
  }

  Future<List<MountainModel>> readJSON() async {
    // load in as string and parse to json
    final response = await rootBundle.loadString("data/models.json");
    final data = await json.decode(response);

    // create the list of models
    for (var i = 0; i < data.length; i++) {
      list.add(MountainModel.fromJSON(data[i]));
    }
    return list;
  }
}
