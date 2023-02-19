import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';

class LikedScreen extends StatefulWidget {
  List<MountainModel> likedList = List.empty(growable: true);
  List<MountainModel> dislikedList = List.empty(growable: true);

  LikedScreen({Key? key, required this.likedList, required this.dislikedList})
      : super(key: key);

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
        leading: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          child: Text('Back'),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Center (child: Text(
          "     To Mountain or Not To Mountain (Your Mountain Matches!)",
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(247, 240, 229, 1)),
        )),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getBodyContent(context)));
  }

  getBodyContent(BuildContext context) {
    return ListView.builder(
      itemCount: widget.likedList.length + widget.dislikedList.length,
      itemBuilder: _getItemUI,
      padding: const EdgeInsets.all(0.0),
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
        Container(
          width: MediaQuery.of(context).size.width * 0.94,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          color: Colors.white70,
          elevation: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      //maxWidth: MediaQuery.of(context).size.width * 0.28,
                      //maxHeight: MediaQuery.of(context).size.width * 0.28,
                      maxHeight: MediaQuery.of(context).size.width * 0.15,
                      minHeight: MediaQuery.of(context).size.width * 0.15,
                      maxWidth: MediaQuery.of(context).size.width * 0.28,
                      minWidth: MediaQuery.of(context).size.width * 0.28,
                    ),
                    child: Image.asset(
                        'assets/images/${itemUIList[index].fileName}',
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                          itemUIList[index].displayName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Text(
                          'Height: ${itemUIList[index].height}. Located in ${itemUIList[index].location}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 40, 0, 0),
                      child: Text(
                        trailingText,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: trailingColor
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
