import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/widgets/swipe_cards.dart';

class SelectionScreen extends StatefulWidget {
  List<MountainModel> modelList;

  SelectionScreen({Key? key, required this.modelList}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.indigo,
        child: Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 40.0)),
            const Text("Good Mountain Bad Mountain????",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Reglisse Back",
                    decoration: TextDecoration.none,
                    fontSize: 100,
                    height: 0.75,
                    color: Color.fromRGBO(47, 235, 97, 100))),
            Expanded(
              child: CardWidget(modelsList: widget.modelList),
              // height: 100,
              // width: 100,
            )
          ],
        )));
    // return Container(
    //     child: Column(
    //   children: [
    //     // Padding(padding: EdgeInsets.only(top: 20.0)),
    //     // SizedBox(
    //     //     height: 100,
    //     //     width: 400,
    //     //     child: Text("How Mountain is that Mountain?",
    //     //         textAlign: TextAlign.center,
    //     //         style: TextStyle(
    //     //             fontFamily: "Reglisse Back",
    //     //             decoration: TextDecoration.none,
    //     //             fontSize: 100,
    //     //             height: 0.75,
    //     //             color: Colors.black))),
    //     // Padding(padding: EdgeInsets.only(top: 20.0)),
    //     CardWidget(modelsList: widget.modelList)
    //   ],
    // ));
    // child: CardWidget(modelsList: widget.modelList),;
  }
}
