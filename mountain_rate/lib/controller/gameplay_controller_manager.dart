import 'package:flutter/material.dart';
import 'package:mountain_rate/models/mountain_model.dart';
import 'package:mountain_rate/screens/liked_screen.dart';

class CardManagerController {
  List<MountainModel> likedList = List.empty(growable: true);
  List<MountainModel> dislikedList = List.empty(growable: true);

  var quotes = ["Never measure the height of a mountain until you reach the top. Then you will see how low it was.",
  "Somewhere between the bottom of the climb and the summit is the answer to the mystery why we climb.",
  "The mountains are calling, and I must go.", "The way up to the top of the mountain is always longer than you think.",
  "The best view comes after the hardest climb.", "Every mountain top is within reach if you just keep climbing.",
  "Every man should pull a boat over a mountain once in his life.","How glorious a greeting the sun gives the mountains!", 
  "We are now in the mountains and they are in us, kindling enthusiasm,making every nerve quiver, filling every pore and cell of us.",
  "May your dreams be larger than mountains and may you have the courage to scale their summits.", 
  "The mountain and the sea, are excellent schoolmasters, and teach some of us more than what we could learn from books.",
  "Great things are done when men and mountains meet; This is not done by jostling in the street.",
  "Climb the mountains and get their good tidings. Nature's peace will flow into you as sunshine flows into trees.",
  "What are men to rocks and mountains?", "The greatest gift of life on the mountain is time.",
  "Those who travel to mountain-tops are half in love with themselves, and half in love with oblivion.",
  "Mountains, according to the angle of view, the season, the time of day, the beholder’s frame of mind, or any one thing, can effectively change their appearance.",
  "Mountains are not Stadiums where I satisfy my ambition to achieve, they are the cathedrals where I practice my religion."
  ];

  int i = 0;

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

  getQuote() {
    i++;
    return quotes[i%quotes.length];
  }
}
