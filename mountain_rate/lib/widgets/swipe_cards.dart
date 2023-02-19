import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
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

  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }

  @override
  void initState() {
    // TODO: implement initState
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
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Container(
          height: 550,
          child: SwipeCards(
            matchEngine: matchEngine,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  alignment: Alignment.center,
                  child: Text(
                    (swipeItems[index].content as MountainModel).displayName,
                    style: TextStyle(fontSize: 100, color: Colors.red),
                  ));
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
          ),
        ),
      ],
    )));
  }
}

// Stuff for Swipe Cards
