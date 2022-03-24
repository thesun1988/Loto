import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loto_cai/models/numbers.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
//import 'package:cool_alert/cool_alert.dart';

class Game extends StatelessWidget {
  final List bingo = [' ', 'Minh', 'Nhật', '-', 'Nam', 'Phương', ' '];

  //void gerenateRandom()

  @override
  Widget build(BuildContext context) {
    return Consumer<Numbers>(
      builder: (BuildContext context, Numbers obj, Widget? child) {
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Bingo with family'),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Row(
                //   children: <Widget>[
                //     AnimatedContainer(
                //       curve: Curves.fastOutSlowIn,
                //       duration: Duration(seconds: 1),
                //       color: Colors.white,
                //       height: 16,
                //       width: (obj.progress < 5)
                //           ? obj.progress * (MediaQuery.of(context).size.width / 5)
                //           : MediaQuery.of(context).size.width,
                //       child: (obj.progress >= 5) ? Text('You Won') : Text(''),
                //     ),
                //   ],
                // ),
                // Text("ok"),
                SizedBox(height: 20),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(32),
                //     border: Border.all(color: Colors.white, width: 1),
                //     color: Colors.pinkAccent,
                //   ),
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height / 12,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: List.generate(
                //       7,
                //       (index) => Text(
                //         bingo[index],
                //         style: TextStyle(
                //           //fontWeight: FontWeight.bold,
                //           fontSize: 30,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                /*ListView(
                    //scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container(
                        //height: 50,
                        //width: 50,
                        color: Colors.amber[600],
                        child: const Center(child: Text('Entry A')),
                      ),
                      Container(
                        // height: 50,
                        // width: 50,
                        color: Colors.amber[500],
                        child: const Center(child: Text('Entry B')),
                      ),
                      Container(
                        // height: 50,
                        // width: 50,
                        color: Colors.amber[100],
                        child: const Center(child: Text('Entry C')),
                      ),
                    ]),
*/
                // Divider(),

                Center(
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.pinkAccent,
                    ),
                    child: Center(
                      // child: Text(
                      //   obj.count < 0 ? 'Hô' : '${obj.randomNum[obj.count]}',
                      //   style: const TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 60,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      child: obj.count < 0
                          ? Text(
                              "   Nhấn Hô\n Để Bắt Đầu",
                              style: const TextStyle(fontSize: 28),
                            )
                          : AnimatedFlipCounter(
                              duration: Duration(milliseconds: 500),
                              value: obj.randomNum[obj.count],
                              textStyle: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                //letterSpacing: -8.0,
                                color: Colors.yellow,
                                // shadows: [
                                //   BoxShadow(
                                //     color: Colors.orange,
                                //     offset: Offset(8, 8),
                                //     blurRadius: 8,
                                //   ),
                                // ],
                              ), // pass in a value like 2014
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text('Số Vừa Ra:    '),
                    Visibility(
                          //visible: obj.count > 0 ? true : false,
                          child: obj.count > 0 ? Container(
                            width: 50,
                            height: 50,
                            //padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.pinkAccent,
                            ),
                            //width: 50,
                            //color: Colors.amber[600],
                            child: Center(
                              child: Text(obj.count > 0
                                  ? '${obj.randomNum[obj.count - 1]}'
                                  : '1',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)
                                    ),
                            ),
                          ): SizedBox(
                            width: 50,
                            height: 50,
                          )
                        ),
                                SizedBox(
                          width: 5,
                        ),
                        Visibility(
                          visible: obj.count > 1 ? true : false,
                          child: Container(
                            width: 45,
                            height: 45,
                            //padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.pinkAccent,
                            ),
                            //width: 50,
                            //color: Colors.amber[600],
                            child: Center(
                              child: Text(obj.count > 1
                                  ? '${obj.randomNum[obj.count - 2]}'
                                  : '2',
                                   style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            ),
                          ),
                        ),
                                SizedBox(
                          width: 5,
                        ),
                        Visibility(
                          visible: obj.count > 2 ? true : false,
                          child: Container(
                            width: 40,
                            height: 40,
                            //padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.pinkAccent,
                            ),
                            //width: 50,
                            //color: Colors.amber[600],
                            child: Center(
                              child: Text(obj.count > 2
                                  ? '${obj.randomNum[obj.count - 3]}'
                                  : '3',
                                   style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            ),
                          ),
                        ),
                  ],
                ),
                
                        SizedBox(
                  height: 20,
                ),
                Text(
                  'Hàng   x: ' + '${obj.x}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Hàng 1x: ' + '${obj.x1}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Hàng 2x: ' + '${obj.x2}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Hàng 3x: ' + '${obj.x3}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Hàng 4x: ' + '${obj.x4}',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                // Spacer(),
                // SizedBox(
                //   height: 50,
                //   child: ListView(scrollDirection: Axis.horizontal,

                //       // physics: NeverScrollableScrollPhysics(),
                //       children: <Widget>[
                //         Visibility(
                //           visible: obj.count > 0 ? true : false,
                //           child: Container(
                //             width: 50,
                //             height: 50,
                //             //padding: EdgeInsets.all(5),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50),
                //               border: Border.all(color: Colors.black, width: 2),
                //               color: Colors.pinkAccent,
                //             ),
                //             //width: 50,
                //             //color: Colors.amber[600],
                //             child: Center(
                //               child: Text(obj.count > 0
                //                   ? '${obj.randomNum[obj.count - 1]}'
                //                   : '1'),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: 5,
                //         ),
                //         Visibility(
                //           visible: obj.count > 1 ? true : false,
                //           child: Container(
                //             width: 50,
                //             height: 50,
                //             //padding: EdgeInsets.all(5),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50),
                //               border: Border.all(color: Colors.black, width: 2),
                //               color: Colors.pinkAccent,
                //             ),
                //             //width: 50,
                //             //color: Colors.amber[600],
                //             child: Center(
                //               child: Text(obj.count > 1
                //                   ? '${obj.randomNum[obj.count - 2]}'
                //                   : '2'),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: 5,
                //         ),
                //         Visibility(
                //           visible: obj.count > 2 ? true : false,
                //           child: Container(
                //             width: 50,
                //             height: 50,
                //             //padding: EdgeInsets.all(5),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50),
                //               border: Border.all(color: Colors.black, width: 2),
                //               color: Colors.pinkAccent,
                //             ),
                //             //width: 50,
                //             //color: Colors.amber[600],
                //             child: Center(
                //               child: Text(obj.count > 2
                //                   ? '${obj.randomNum[obj.count - 3]}'
                //                   : '3'),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: 5,
                //         ),
                //         Visibility(
                //           visible: obj.count > 3 ? true : false,
                //           child: Container(
                //             width: 50,
                //             height: 50,
                //             //padding: EdgeInsets.all(5),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50),
                //               border: Border.all(color: Colors.black, width: 2),
                //               color: Colors.pinkAccent,
                //             ),
                //             //width: 50,
                //             //color: Colors.amber[600],
                //             child: Center(
                //               child: Text(obj.count > 3
                //                   ? '${obj.randomNum[obj.count - 4]}'
                //                   : '3'),
                //             ),
                //           ),
                //         ),
                //       ]),
                // ),
                //Text('${obj.numbers[i]}'),
                // Text(obj.progress),

                SizedBox(height: 20),
//               GridView.builder(
//                 shrinkWrap: true,
//                 itemCount: obj.numbers.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 5,
//                   crossAxisSpacing: 4,
//                   mainAxisSpacing: 4,
//                 ),
//                 itemBuilder: (context, i) {
//                   return InkWell(
//                     onTap: () {
//                       obj.cross(i);
//                       obj.updateLists(i);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: const Color(0xff5d7fa3),
//                           borderRadius: BorderRadius.circular(32),
//                           // gradient: LinearGradient(
//                           //   begin: Alignment.topLeft,
//                           //   end: Alignment.bottomRight,
//                           //   colors: (!obj.isCrossed[i])
//                           //       ? [Colors.white10, Colors.black12]
//                           //       : [Color(0xff5d7fa3), Color(0xff6e97c2)],
//                           // ),
// //                          border: Border.all(color: Colors.blueGrey),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 5,
//                               offset: Offset(1, 1),
//                             ),
//                             BoxShadow(
//                               color: Colors.white10,
//                               blurRadius: 5,
//                               offset: Offset(-1, -1),
//                             ),
//                           ]),
//                       child: Center(
//                         child: Text(
//                           '${obj.numbers[i]}',
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                             decoration: (obj.isCrossed[i])
//                                 ? TextDecoration.lineThrough
//                                 : TextDecoration.none,
//                             decorationColor: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
                //Spacer(),

                SizedBox(height: 15),
                // Center(
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       elevation: 6.0,
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))
                //     ),
                //       onPressed: () {
                //          obj.shuffle();
                //       },
                //       child: Text(
                //   'Chơi Lại / Đổi Số',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
                // )
                // ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          obj.count < 49
                              ? obj.countUp()
                              : _showErrorDialog(context);
                        },
                        child: const Text('Hô'),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // if (obj.kinh() == true)
                            //   _showKinhDialog(context);
                            // else
                            //   _showErrorDialog(context);
                            obj.shuffle();
                          },
                          child: const Text('Chơi Lại'))
                    ],
                  ),
                ),
              ],
            ),
          ),
// //Float Button
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               obj.shuffle();
//             },
//             tooltip: 'Restart match',
//             elevation: 20,
//             focusColor: Colors.black,
//             backgroundColor: Colors.pink,
//             splashColor: Colors.green,
//             hoverColor: Colors.yellow,
//             child: Icon(Icons.scatter_plot),
//           ),
        );
      },
    );
  }

  _showKinhDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Chúc Mừng, bạn đã Kinh!!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Back"),
                onPressed: () {
                  //Navigator.pushNamed(context, "/screen1");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _showErrorDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Hết Số !!!  Nhấn Chơi Lại"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Quay Về"),
                onPressed: () {
                  //Navigator.pushNamed(context, "/screen1");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
