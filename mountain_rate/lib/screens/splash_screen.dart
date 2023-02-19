import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mountain_rate/screens/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // Widget build(BuildContext context) {
  //   double height = MediaQuery.of(context).size.height;
  //   double width = MediaQuery.of(context).size.width;

  //   return Center(
  //     child: SizedBox(
  //       height: height,
  //       width: width,
  //       child:
  //           Expanded(child: Image.asset("/home/evan/Downloads/mountain.jpg")),
  //     ),
  //   );
  // }

  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
  
  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }
route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomeScreen()
      )
    ); 
  }
  
  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   child: Image.asset("images/logo.png"),
            // ),
             Padding(padding: EdgeInsets.only(top: 100.0)),
            Text(
              "Loading..",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 3,
           )
         ],
       ),
      ),
    );
  }
}
