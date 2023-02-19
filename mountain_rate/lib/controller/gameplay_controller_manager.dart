import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/screens/liked_screen.dart';

class CardManagerController {
  List<MountainModel> likedList = List.empty(growable: true);
  List<MountainModel> dislikedList = List.empty(growable: true);

  addLiked(MountainModel model) {
    likedList.add(model);
  }

  addDisliked(MountainModel model) {
    dislikedList.add(model);
  }

  goLikedScreen(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LikedScreen(likedList: likedList, dislikedList: dislikedList)));
  }
}
