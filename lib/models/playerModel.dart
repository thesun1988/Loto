// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Numbers extends ChangeNotifier {
//   final List numbers = List.generate(25, (int index) => index + 1)..shuffle();
//   final List isCrossed = List.generate(25, (int index) => false);
//   final List dLeft = [];
//   final List dRight = [];
//   final List c1 = [];
//   final List c2 = [];
//   final List c3 = [];
//   final List c4 = [];
//   final List c5 = [];
//   final List r1 = [];
//   final List r2 = [];
//   final List r3 = [];
//   final List r4 = [];
//   final List r5 = [];
//   int progress = 0;

//   void shuffle() {
//     numbers.shuffle();
//     isCrossed.fillRange(0, 25, false);
//     progress = 0;
//     dLeft.clear();
//     dRight.clear();
//     c1.clear();
//     c2.clear();
//     c3.clear();
//     c4.clear();
//     c5.clear();
//     r1.clear();
//     r2.clear();
//     r3.clear();
//     r4.clear();
//     r5.clear();
//     notifyListeners();
//   }

//   void cross(int index) {
//     isCrossed[index] = !isCrossed[index];
//     notifyListeners();
//   }

//   void updateLists(int index) {
//     if (isCrossed[index]) {
//       if (index % 6 == 0) {
//         dLeft.add(index);
//         if (dLeft.length == 5) progress++;
//       }
//       if (index % 4 == 0 && index != 24 && index != 0) {
//         dRight.add(index);
//         if (dRight.length == 5) progress++;
//       }
//       if (index % 5 == 0) {
//         r1.add(index);
//         if (r1.length == 5) progress++;
//       }
//       if (index % 5 == 1) {
//         r2.add(index);
//         if (r2.length == 5) progress++;
//       }
//       if (index % 5 == 2) {
//         r3.add(index);
//         if (r3.length == 5) progress++;
//       }
//       if (index % 5 == 3) {
//         r4.add(index);
//         if (r4.length == 5) progress++;
//       }
//       if (index % 5 == 4) {
//         r5.add(index);
//         if (r5.length == 5) progress++;
//       }
//       if (index ~/ 5 == 0) {
//         c1.add(index);
//         if (c1.length == 5) progress++;
//       }
//       if (index ~/ 5 == 1) {
//         c2.add(index);
//         if (c2.length == 5) progress++;
//       }
//       if (index ~/ 5 == 2) {
//         c3.add(index);
//         if (c3.length == 5) progress++;
//       }
//       if (index ~/ 5 == 3) {
//         c4.add(index);
//         if (c4.length == 5) progress++;
//       }
//       if (index ~/ 5 == 4) {
//         c5.add(index);
//         if (c5.length == 5) progress++;
//       }
//     } else {
//       if (index % 6 == 0) {
//         if (dLeft.length == 5) progress--;
//         dLeft.remove(index);
//       }
//       if (index % 4 == 0 && index != 24 && index != 0) {
//         if (dRight.length == 5) progress--;
//         dRight.remove(index);
//       }
//       if (index % 5 == 0) {
//         if (r1.length == 5) progress--;
//         r1.remove(index);
//       }
//       if (index % 5 == 1) {
//         if (r2.length == 5) progress--;
//         r2.remove(index);
//       }
//       if (index % 5 == 2) {
//         if (r3.length == 5) progress--;
//         r3.remove(index);
//       }
//       if (index % 5 == 3) {
//         if (r4.length == 5) progress--;
//         r4.remove(index);
//       }
//       if (index % 5 == 4) {
//         if (r5.length == 5) progress--;
//         r5.remove(index);
//       }
//       if (index ~/ 5 == 0) {
//         if (c1.length == 5) progress--;
//         c1.remove(index);
//       }
//       if (index ~/ 5 == 1) {
//         if (c2.length == 5) progress--;
//         c2.remove(index);
//       }
//       if (index ~/ 5 == 2) {
//         if (c3.length == 5) progress--;
//         c3.remove(index);
//       }
//       if (index ~/ 5 == 3) {
//         if (c4.length == 5) progress--;
//         c4.remove(index);
//       }
//       if (index ~/ 5 == 4) {
//         if (c5.length == 5) progress--;
//         c5.remove(index);
//       }
//     }
//   }
// }
import 'package:flutter/material.dart';

class PlayerModel extends ChangeNotifier {
  // ignore: deprecated_member_use

  // ignore: deprecated_member_use
  List numbers = List.filled(25, null, growable: false);
  // ignore: deprecated_member_use
  List numbersTemp = List.generate(5, (i) => List.filled(5, 0, growable: false),
      growable: false);

  // List numbersTemp = List.generate(
  //     5, (i) => List.filled(5, null, growable: false),
  //     growable: false);
  final List isCrossed = List.generate(25, (int index) => false);
  List randomNum = List.generate(50, (int index) => index)..shuffle();
  final List dLeft = [];
  final List dRight = [];
  final List<int> c1 = [];
  final List<int> c2 = [];
  final List<int> c3 = [];
  final List<int> c4 = [];
  final List<int> c5 = [];
  final List r1 = [];
  final List r2 = [];
  final List r3 = [];
  final List r4 = [];
  final List r5 = [];
  // ignore: deprecated_member_use
  List<int> recentNumbers = <int>[];
  // ignore: deprecated_member_use
  List<int> calledNumbers = <int>[];
  String progress = "";
  int count = -1;

  PlayerModel() {
    //create a random column number;
    List randomNumbersc1 = List.generate(9, (index) => index + 1);
    print(randomNumbersc1);
    randomNumbersc1.shuffle();
    List randomNumbersc2 = List.generate(10, (index) => index + 10);
    print(randomNumbersc2);
    randomNumbersc2.shuffle();
    List randomNumbersc3 = List.generate(10, (index) => index + 20);
    randomNumbersc3.shuffle();
    List randomNumbersc4 = List.generate(10, (index) => index + 30);
    randomNumbersc4.shuffle();
    List randomNumbersc5 = List.generate(11, (index) => index + 40);
    randomNumbersc5.shuffle();

    for (var i = 0; i < 5; i++) {
      numbersTemp[i][0] = randomNumbersc1[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][1] = randomNumbersc2[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][2] = randomNumbersc3[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][3] = randomNumbersc4[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][4] = randomNumbersc5[i];
    }
    int a = 0;
    for (int i = 0; i < numbersTemp.length; i++) {
      // tiny change 1: proper dimensions
      for (int j = 0; j < numbersTemp[i].length; j++) {
        // tiny change 2: actually store the values
        numbers[a] = numbersTemp[i][j];
        a++;
      }
    }
  }

  void createNew() {
    //create a random column number;
    List randomNumbersc1 = List.generate(9, (index) => index + 1);
    randomNumbersc1.shuffle();
    List randomNumbersc2 = List.generate(10, (index) => index + 10);
    randomNumbersc2.shuffle();
    List randomNumbersc3 = List.generate(10, (index) => index + 20);
    randomNumbersc3.shuffle();
    List randomNumbersc4 = List.generate(10, (index) => index + 30);
    randomNumbersc4.shuffle();
    List randomNumbersc5 = List.generate(11, (index) => index + 40);
    print(randomNumbersc5);
    randomNumbersc5.shuffle();

    for (var i = 0; i < 5; i++) {
      numbersTemp[i][0] = randomNumbersc1[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][1] = randomNumbersc2[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][2] = randomNumbersc3[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][3] = randomNumbersc4[i];
    }
    for (var i = 0; i < 5; i++) {
      numbersTemp[i][4] = randomNumbersc5[i];
    }
    int a = 0;
    for (int i = 0; i < numbersTemp.length; i++) {
      // tiny change 1: proper dimensions
      for (int j = 0; j < numbersTemp[i].length; j++) {
        // tiny change 2: actually store the values
        numbers[a] = numbersTemp[i][j];
        a++;
      }
    }
  }

  kinh() {
    print("hang 1:${c1.length}");
    print("hang 2:${c2.length}");
    print("hang 3:${c3.length}");
    print("hang 4:${c4.length}");
    print("hang 5:${c5.length}");

    if (c1.length == 5) return checkKinh(c1);
    if (c2.length == 5) return checkKinh(c2);
    if (c3.length == 5) return checkKinh(c3);
    if (c4.length == 5) return checkKinh(c4);
    if (c1.length == 5) return checkKinh(c5);
  }
  clearBoard()
  {
    isCrossed.fillRange(0, 25, false);
    c1.clear();
    c2.clear();
    c3.clear();
    c4.clear();
    c5.clear();
    r1.clear();
    r2.clear();
    r3.clear();
    r4.clear();
    r5.clear();
    notifyListeners();
  }

  checkLine() {
    return ((c1.length == 5) || (c2.length == 5) || (c3.length == 5) || (c4.length == 5) || (c5.length == 5)) ? true : false;
  }

  checkKinh(List<int> a) {
    print(calledNumbers);
    print(a);
    if (Set.of(calledNumbers).containsAll(a) == true) {
      return true;
    } else
      return false;
  }

  void countUp() {
    count++;
    calledNumbers.add(randomNum[count]);
    // recentNumbers.add();
    notifyListeners();
  }

  void shuffle() {
    // ignore: deprecated_member_use
    recentNumbers = <int>[];
    // ignore: deprecated_member_use
    calledNumbers = <int>[];
    count = 0;
    createNew();
    isCrossed.fillRange(0, 25, false);
    randomNum.shuffle();
    progress = "";
    dLeft.clear();
    dRight.clear();
    c1.clear();
    c2.clear();
    c3.clear();
    c4.clear();
    c5.clear();
    r1.clear();
    r2.clear();
    r3.clear();
    r4.clear();
    r5.clear();
    notifyListeners();
  }

  void cross(int index) {
    isCrossed[index] = !isCrossed[index];
    notifyListeners();
  }

  void updateLists(int index) {
    if (isCrossed[index]) {
      // if (index % 6 == 0) {
      //   dLeft.add(index);
      //   if (dLeft.length == 5) progress++;
      // }
      // if (index % 4 == 0 && index != 24 && index != 0) {
      //   dRight.add(index);
      //   if (dRight.length == 5) progress++;
      // }
      // if (index % 5 == 0) {
      //   r1.add(index);
      //   if (r1.length == 5) progress++;
      // }
      // if (index % 5 == 1) {
      //   r2.add(index);
      //   if (r2.length == 5) progress++;
      // }
      // if (index % 5 == 2) {
      //   r3.add(index);
      //   if (r3.length == 5) progress++;
      // }
      // if (index % 5 == 3) {
      //   r4.add(index);
      //   if (r4.length == 5) progress++;
      // }
      // if (index % 5 == 4) {
      //   r5.add(index);
      //   if (r5.length == 5) progress++;
      // }
      if (index ~/ 5 == 0) {
        c1.add(numbers[index]);
        if (c1.length == 4) progress = "Chờ";
        if (c1.length == 5) progress = "Kinh";
      }
      if (index ~/ 5 == 1) {
        c2.add(numbers[index]);
        if (c2.length == 4) progress = "Chờ";
        if (c2.length == 5) progress = "Kinh";
      }
      if (index ~/ 5 == 2) {
        c3.add(numbers[index]);
        if (c3.length == 4) progress = "Chờ";
        if (c3.length == 5) progress = "Kinh";
      }
      if (index ~/ 5 == 3) {
        c4.add(numbers[index]);
        if (c4.length == 4) progress = "Chờ";
        if (c4.length == 5) progress = "Kinh";
      }
      if (index ~/ 5 == 4) {
        c5.add(numbers[index]);
        if (c5.length == 4) progress = "Chờ";
        if (c5.length == 5) progress = "Kinh";
      }
    } else {
      //   if (index % 6 == 0) {
      //     if (dLeft.length == 5) progress--;
      //     dLeft.remove(index);
      //   }
      //   if (index % 4 == 0 && index != 24 && index != 0) {
      //     if (dRight.length == 5) progress--;
      //     dRight.remove(index);
      //   }
      //   if (index % 5 == 0) {
      //     if (r1.length == 5) progress--;
      //     r1.remove(index);
      //   }
      //   if (index % 5 == 1) {
      //     if (r2.length == 5) progress--;
      //     r2.remove(index);
      //   }
      //   if (index % 5 == 2) {
      //     if (r3.length == 5) progress--;
      //     r3.remove(index);
      //   }
      //   if (index % 5 == 3) {
      //     if (r4.length == 5) progress--;
      //     r4.remove(index);
      //   }
      //   if (index % 5 == 4) {
      //     if (r5.length == 5) progress--;
      //     r5.remove(index);
      //   }
      if (index ~/ 5 == 0) {
        if (c1.length == 5) progress = "cho";
        c1.remove(numbers[index]);
      }
      if (index ~/ 5 == 1) {
        if (c2.length == 5) progress = "cho";
        c2.remove(numbers[index]);
      }
      if (index ~/ 5 == 2) {
        if (c3.length == 5) progress = "cho";
        c3.remove(numbers[index]);
      }
      if (index ~/ 5 == 3) {
        if (c4.length == 5) progress = "cho";
        c4.remove(numbers[index]);
      }
      if (index ~/ 5 == 4) {
        if (c5.length == 5) progress = "cho";
        c5.remove(numbers[index]);
      }
    }
  }
}
