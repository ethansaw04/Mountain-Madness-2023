import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/widgets/swipe_card_builder.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:mountain_rate/controller/gameplay_controller_manager.dart';

class CardWidget extends StatefulWidget {
  List<MountainModel> modelsList;
  CardManagerController controller;
  CardWidget({Key? key, required this.modelsList, required this.controller})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // stuff for the swipe cards
  late MatchEngine matchEngine;
  List<SwipeItem> swipeItems = List.empty(growable: true);
  bool isLiked = false;

  @override
  void initState() {
    for (var i = 0; i < widget.modelsList.length; i++) {
      swipeItems.add(SwipeItem(
          content: widget.modelsList[i],
          likeAction: () {
            isLiked = true;
          },
          nopeAction: () {
            isLiked = false;
          },
          superlikeAction: () {}));
    }

    matchEngine = MatchEngine(swipeItems: swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SwipeCards(
      matchEngine: matchEngine,
      itemBuilder: (BuildContext context, int index) {
        return Center(
            child: SizedBox(
                height: height * 0.8,
                width: width * 0.6,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: SizedBox.expand(
                      child: CardBuilderFromModel(
                          model: swipeItems[index].content),
                    ))));
      },
      onStackFinished: () {
        widget.controller.goLikedScreen(context);
      },
      itemChanged: (SwipeItem item, int index) {
        if (isLiked) {
          widget.controller.addLiked(item.content);
        } else {
          widget.controller.addDisliked(item.content);
        }
      },
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }
}
