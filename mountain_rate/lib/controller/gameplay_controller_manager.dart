import 'package:mountain_rate/models/mountain_model.dart';

class CardManagerController {
  List<MountainModel> likedList = List.empty(growable: true);
  List<MountainModel> dislikedList = List.empty(growable: true);

  addLiked(MountainModel model) {
    likedList.add(model);
  }

  addDisliked(MountainModel model) {
    dislikedList.add(model);
  }
}
