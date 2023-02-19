import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';

class SelectionScreen extends StatefulWidget {
  List<MountainModel> modelList = List.empty(growable: true);

  SelectionScreen({Key? key, required this.modelList}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("There are this many models ${widget.modelList.length}"),
    );
  }
}
