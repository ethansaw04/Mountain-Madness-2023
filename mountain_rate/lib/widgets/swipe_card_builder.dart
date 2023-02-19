import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';

class CardBuilderFromModel extends StatelessWidget {
  MountainModel model;

  CardBuilderFromModel({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 100,
        color: Colors.orange,
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset("assets/images/${model.fileName}"),
                ),
                Text(
                  model.displayName,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  model.height,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  model.location,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  model.type,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  model.climbers,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  model.fact,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )));
  }
}
