import 'package:flutter/material.dart';

class MyProvide with ChangeNotifier {

  MyProvide();

  /// ------ 阅读人数 -------
  int _num = 0;
  int get getNum => _num;
  void addNum() {
    _num++;
    notifyListeners();
  }

  /// -------- 收藏 ---------
  bool _isFavorite = false;
  bool get getIsFavorite => _isFavorite;
  void changeFavorite(bool isFavorite) {
    _isFavorite = isFavorite;
    notifyListeners();
  }
}
