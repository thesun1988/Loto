
import 'package:loto_cai/models/numbers.dart';
import 'package:loto_cai/screens/host.dart';
import 'package:flutter/material.dart';
import 'package:loto_cai/screens/role.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Bingo_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        canvasColor: Colors.yellow[700],
        splashColor: Colors.green,
        highlightColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.yellow[200],
        //scaffoldBackgroundColor: Color(0xff678db5),
      ),
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) {
      //     return Numbers();
      //   },
      //   child: Role(),
      // ),
      home: Role(),
      debugShowCheckedModeBanner: false,
    );
  }
}
