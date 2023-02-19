import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/widgets/swipe_cards.dart';
import 'package:mountain_rate/controller/gameplay_controller_manager.dart';
import 'package:mountain_rate/screens/liked_screen.dart';


class SelectionScreen extends StatefulWidget {
  List<MountainModel> modelList;
  CardManagerController controller = CardManagerController();

  var quotes = ["Never measure the height of a mountain until you reach the top. Then you will see how low it was.",
  "Somewhere between the bottom of the climb and the summit is the answer to the mystery why we climb.",
  "The mountains are calling, and I must go.", '''The way up to the top of the mountain is always longer than you think. 
  Don’t fool yourself, the moment will arrive when what seemed so near is still very far.''',
  "The best view comes after the hardest climb.", "Every mountain top is within reach if you just keep climbing.",
  "Every man should pull a boat over a mountain once in his life.",'''We are now in the mountains and they are in us, kindling enthusiasm, 
  making every nerve quiver, filling every pore and cell of us.''','''The mountains were his masters. They rimmed in life. 
  They were the cup of reality, beyond growth, beyond struggle and death. They were his absolute unity in the midst of eternal change''',
  "May your dreams be larger than mountains and may you have the courage to scale their summits.", '''Earth and sky, woods and fields, 
  lakes and rivers, the mountain and the sea, are excellent schoolmasters, and teach some of us more than what we could learn from books.''',
  "Great things are done when men and mountains meet; This is not done by jostling in the street.",
  "Climb the mountains and get their good tidings. Nature's peace will flow into you as sunshine flows into trees.",
  "What are men to rocks and mountains?", "Those who travel to mountain-tops are half in love with themselves, and half in love with oblivion.",
  "How glorious a greeting the sun gives the mountains!", '''The greatest gift of life on the mountain is time. Time to think or not think, 
  read or not read, scribble or not scribble—to sleep and cook and walk in the woods, to sit and stare at the shapes of the hills.''',
  '''Mountains, according to the angle of view, the season, the time of day, the beholder’s frame of mind, or any one thing, 
  can effectively change their appearance. Thus, it is essential to recognize that we can never know more than one side, 
  one small aspect of a mountain.''', '''I'm a person of the mountains and the open paddocks and the big empty sky, that's me, 
  and I knew if I spent too long away from all that I'd die; I don't know what of, I just knew I'd die.'''
  "Mountains are not Stadiums where I satisfy my ambition to achieve, they are the cathedrals where I practice my religion."
  ];

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
                        )))),
            const SizedBox(
              height: 20,
            )
          ],
        )));
  }
}
