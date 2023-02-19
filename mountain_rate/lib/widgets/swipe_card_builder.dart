import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';

class CardBuilderFromModel extends StatelessWidget {
  MountainModel model;

  CardBuilderFromModel({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 100,
        color: Color.fromRGBO(247, 240, 229, 1),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset("assets/images/${model.fileName}"),
                ),
                Text(
                  "${model.displayName} (${model.location})",
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Text(
                  model.height,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Text(
                //   model.type,
                //   style: TextStyle(fontSize: 20),
                // ),
                // Text(
                //   model.climbers,
                //   style: TextStyle(fontSize: 20),
                // ),
                Center(
                    child: Text(
                  "Mountain Fact: ${model.fact}",
                  style: TextStyle(fontSize: 25),
                ))
                // Text(
                //   model.fact,
                //   style: TextStyle(fontSize: 25),
                // ),
              ],
            )));
  }
}
