import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(child: Image.asset("assets/images.jpg"),)
  //     child: Container(
  //     height: 200,
  //     width: double.infinity,
  //     decoration: const BoxDecoration(
  //     image: DecorationImage(
  //         image: Image.asset("assets/images/home_art.jpg"),
  //         fit: BoxFit.cover),
  // )
        child:
            Expanded(child: 
                Text("""\nHow Mountain is 
that Mountain?""",
                      textAlign: TextAlign.center,
                      style:TextStyle(fontFamily:"Reglisse Back",
                      decoration: TextDecoration.none,
                      fontSize: 100,
                      height: 0.75,
                      color:Colors.blue[200]))),
    );
  }
}
