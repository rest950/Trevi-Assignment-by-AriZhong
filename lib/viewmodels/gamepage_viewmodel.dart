import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class GamePageViewModel extends ChangeNotifier {
  final int colNum;
  final int rowNum;

  Random _random;
  Timer _timer;
  int randomX;
  int randomY;

  GamePageViewModel(this.colNum, this.rowNum) {
    _random = Random();
    //10秒計時器
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      GenRandom();
    });
  }

  @override
  void dispose() {
    super.dispose();
    //釋放計時器
    _timer.cancel();
  }

  //清除狀態
  void Clean() {
    randomX = -1;
    randomY = -1;
    notifyListeners();
  }

  //產生亂數
  void GenRandom() {
    randomX = _random.nextInt(colNum);
    randomY = _random.nextInt(rowNum);
    //print('Col: $randomX');
    //print('Row: $randomY');
    notifyListeners();
  }
}
