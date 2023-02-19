import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/widgets/swipe_cards.dart';
import 'package:mountain_rate/controller/gameplay_controller_manager.dart';
import 'package:mountain_rate/screens/liked_screen.dart';

class SelectionScreen extends StatefulWidget {
  List<MountainModel> modelList;
  CardManagerController controller = CardManagerController();

  SelectionScreen({Key? key, required this.modelList}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.blue[300],
        child: Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            const Text("Good Mountain Bad Mountain????",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Reglisse Back",
                    decoration: TextDecoration.none,
                    fontSize: 100,
                    height: 0.75,
                    color: Colors.black)),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: CardWidget(
                  modelsList: widget.modelList, controller: widget.controller),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Align(
                    alignment: Alignment.centerRight,
                    // child: SizedBox(
                    //     width: 150,
                    //     height: 50,
                    child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                          ),
                          iconSize: 75,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          // style: ButtonStyle(
                          //     backgroundColor:
                          //         MaterialStateProperty.all<Color>(Colors.black),
                          //     foregroundColor: MaterialStateProperty.all<Color>(
                          //         Colors.transparent)),
                          onPressed: () =>
                              widget.controller.goLikedScreen(context),
                        )))),
            const SizedBox(
              height: 20,
            )
          ],
        )));
  }
}
