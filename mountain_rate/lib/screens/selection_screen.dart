import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/widgets/swipe_cards.dart';
import 'package:mountain_rate/controller/gameplay_controller_manager.dart';
import 'package:mountain_rate/screens/liked_screen.dart';
import 'dart:async';


class SelectionScreen extends StatefulWidget {
  List<MountainModel> modelList;
  CardManagerController controller = CardManagerController();

  SelectionScreen({Key? key, required this.modelList}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  Timer? timer;

  void initTimer() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
    //job
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initTimer();
    return Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.blue[300],
        child: Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            const Text("Good Mountain\nBad Mountain????",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Reglisse Back",
                    decoration: TextDecoration.none,
                    fontSize: 100,
                    height: 0.75,
                    color: Color.fromRGBO(247, 240, 229, 1))),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: CardWidget(
                  modelsList: widget.modelList, controller: widget.controller),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Stack(
                  children: [
                    Align(
                    alignment: Alignment.centerRight,
                    child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Color.fromRGBO(247, 240, 229, 1),
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
                        ))),
                    Align(
                      alignment: Alignment.center,
                      child: Text(widget.controller.getQuote())
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            )
          ],
        )));
  }
}
