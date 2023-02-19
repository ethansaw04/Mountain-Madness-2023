import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/widgets/swipe_card_builder.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CardWidget extends StatefulWidget {
  List<MountainModel> modelsList;

  CardWidget({Key? key, required this.modelsList}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // stuff for the swipe cards
  late MatchEngine matchEngine;
  List<SwipeItem> swipeItems = List.empty(growable: true);

  @override
  void initState() {
    for (var i = 0; i < widget.modelsList.length; i++) {
      swipeItems.add(SwipeItem(
          content: widget.modelsList[i],
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${widget.modelsList[i].displayName}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Disliked ${widget.modelsList[i].displayName}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("SuperLiked ${widget.modelsList[i].displayName}"),
              duration: Duration(milliseconds: 500),
            ));
          }));
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("StackDone"),
          duration: Duration(milliseconds: 500),
        ));
      },
      itemChanged: (SwipeItem item, int index) {
        print('item: , index: $index');
      },
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }
}
