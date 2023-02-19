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

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/mountainback.jpg"),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            const SizedBox(
                child: Text("\nHow Mountain is  \nthat Mountain?  ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "Reglisse Back",
                        decoration: TextDecoration.none,
                        fontSize: 85,
                        height: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            const Padding(padding: EdgeInsets.only(bottom: 450)),
            // Padding(
            //   padding: EdgeInsets.only(top: 50, bottom: 50),
            // ),
            // SizedBox(height: 250),
            Column(
              children: const [
                Text(
                  "Loading..",
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20.0)),
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 10,
                  color: Colors.black,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  startTime() async {
    readJSON().then((value) {
      Timer(const Duration(milliseconds: 4500), () => route(value));
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
    list.shuffle();
    return list;
  }
}
