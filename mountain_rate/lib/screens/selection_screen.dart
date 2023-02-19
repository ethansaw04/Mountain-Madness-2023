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
                    color: Color.fromRGBO(47, 235, 97, 1))),
            Expanded(
              child: CardWidget(
                  modelsList: widget.modelList, controller: widget.controller),
              // height: 100,
              // width: 100,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () => route(widget.controller.likedList, widget.controller.dislikedList), 
              child: Text('View liked/disliked')
            )
          ],
        )));
  }

  route(liked, disliked) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LikedScreen(likedList: liked, dislikedList: disliked)));
  }
}
