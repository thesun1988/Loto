import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loto_cai/models/playerModel.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
//import 'package:cool_alert/cool_alert.dart';

class Player extends StatelessWidget {
  final List bingo = [' ', 'Minh', 'Nhật', '-', 'Nam', 'Phương', ' '];


  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerModel>(
      builder: (BuildContext context, PlayerModel obj, Widget? child) {
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Bingo with family'),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.pinkAccent,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    7,
                    (index) => Text(
                      bingo[index],
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              
              SizedBox(height: 35),
              GridView.builder(
                shrinkWrap: true,
                itemCount: obj.numbers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      obj.cross(i);
                      obj.updateLists(i);
                      if (obj.checkLine() == true) {
                        _showKinhDialog(context);
                      }
                      ;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff5d7fa3),
                          borderRadius: BorderRadius.circular(32),
                          
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(1, 1),
                            ),
                            BoxShadow(
                              color: Colors.white10,
                              blurRadius: 5,
                              offset: Offset(-1, -1),
                            ),
                          ]),
                      child: Center(
                        child: AnimatedFlipCounter(
                          duration: Duration(milliseconds: 1000),
                          value: obj.numbers[i],
                          textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            decoration: (obj.isCrossed[i])
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.red,
                          ),
                        ),
                       
                      ),
                    ),
                  );
                },
              ),
              //Spacer(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 6.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    onPressed: () async {
                      var a = await _resetDialog(context);
                      print(a);
                      if (a == true) obj.shuffle();
                    },
                    child: Text(
                      'Đổi Bảng Số',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )),
                  Center(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 6.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                    onPressed: () async {
                      var a = await _resetBoard(context);
                      print(a);
                      if (a == true) obj.clearBoard();
                    },
                    child: Text(
                      'Chơi Lại',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              
              Center(
                child: Text('Made by Nhat Tran',
                    style: TextStyle(fontSize: 13)),
              ),

              
            ],
          ),

        );
      },
    );
  }

  _showKinhDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: new Text("K I N H  ! ! !"),
            ),
            content: Text("Hãy Thông Báo Với Ban Tổ Chức Để Nhận Giải Thưởng"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  //Navigator.pushNamed(context, "/screen1");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
  _resetBoard(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Bạn Có Muốn Chơi Ván Mới Không?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Đồng Ý"),
              ),
              new FlatButton(
                  child: new Text("Trở Về"),
                  onPressed: () {
                    //Navigator.pushNamed(context, "/screen1");
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  _resetDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Bạn Có Muốn Đổi Bảng Số Mới Không?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("Đồng Ý"),
              ),
              new FlatButton(
                  child: new Text("Trở Về"),
                  onPressed: () {
                    //Navigator.pushNamed(context, "/screen1");
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  _showErrorDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Có Sai Số"),
            actions: <Widget>[
              new TextButton(
                child: new Text("Trở Về"),
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
