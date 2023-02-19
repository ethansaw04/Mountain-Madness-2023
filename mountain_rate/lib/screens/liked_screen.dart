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
  int liked = 0;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text("There are ${widget.likedList.length} liked models and ${widget.dislikedList.length} disliked models"),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Which mountains did you like?",
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getBodyContent(context)));
  }

  getBodyContent(BuildContext context) {
    return ListView.builder(
      itemCount: widget.likedList.length + widget.dislikedList.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    if (index < widget.likedList.length) {
      liked = 1;
    } else {
      liked = 0;
      index = index - widget.likedList.length;
    }
    String trailingText = "";
    Color trailingColor = Colors.red;
    List<MountainModel> itemUIList = widget.likedList;
    if (liked == 1) {
      trailingText = "Liked!";
      trailingColor = Colors.green;
      itemUIList = widget.likedList;
    } else {
      trailingText = "Disliked!";
      trailingColor = Colors.red;
      itemUIList = widget.dislikedList;
    }
    return Card(
      child: Column(
    
    children: <Widget>[
      ListTile(
        leading: Image.asset(
          "assets/images/${itemUIList[index].fileName}",
          fit: BoxFit.cover,
          width: 100.0,
        ),

        title: Text(
          itemUIList[index].displayName,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(itemUIList[index].location,
                  style: new TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.normal)),
              Text('Height: ${itemUIList[index].height}',
                  style: new TextStyle(
                      fontSize: 11.0, fontWeight: FontWeight.normal)),
            ]),
        trailing: Text(trailingText,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: trailingColor),
        ),
      )
    ],
  ));
  }
}