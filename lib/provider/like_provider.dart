import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LikeProvider with ChangeNotifier {
  final List<String> _likedItem = [];
  List<String> get likedItem => _likedItem;

  final List<int> _liked = [];
  List<int> get liked => _liked;

  void addLiked(int value) {
    _liked.add(value);
    notifyListeners();
  }

  void addLikedItem(value) {
    _likedItem.add(value);
    notifyListeners();
  }

  void removeLikedItem(value) {
    _likedItem.remove(value);
    notifyListeners();
  }

  void removeLiked(int value) {
    _liked.remove(value);
    notifyListeners();
  }
}
