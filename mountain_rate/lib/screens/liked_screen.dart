import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';

class LikedScreen extends StatefulWidget {
   List<MountainModel> likedList = List.empty(growable: true);
   List<MountainModel> dislikedList = List.empty(growable: true);

  LikedScreen({Key? key, required this.likedList, required this.dislikedList}) : super(key: key);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {

  void addLiked(List<MountainModel> arr, int liked) { //arr is the list, liked is the parameter for assigning to liked/disliked section
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == liked) {
        //add to liked == 1 -> liked section, liked == 0 -> disiked section
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("There are ${widget.likedList.length} liked models and ${widget.dislikedList.length}"),
    );
  }
}