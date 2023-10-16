import 'package:flutter/cupertino.dart';

extension RangeExtension on int {
  int getResult(int maxInclusive) {
    int result = 0;
    List<int> intList = [for (int i = this + 1; i < maxInclusive; i++) i];
    debugPrint("list==>$intList");
    for (int item in intList) {
      result += item;
    }
    debugPrint("result==>${result}");
    return result;
  }
}
