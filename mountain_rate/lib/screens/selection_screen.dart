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
      child: CardWidget(modelsList: widget.modelList),
    );
  }
}
