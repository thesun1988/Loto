import 'package:flutter/material.dart';
import 'package:loto_cai/models/numbers.dart';
import 'package:loto_cai/models/playerModel.dart';
import 'package:loto_cai/screens/host.dart';
import 'package:loto_cai/screens/player.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Role extends StatefulWidget {
  const Role({Key? key}) : super(key: key);

  @override
  _RoleState createState() => _RoleState();
}

class _RoleState extends State<Role> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Lottie.network(
          //   'https://assets10.lottiefiles.com/packages/lf20_rthwmsiz.json',
          //   width: 240,
          //   frameRate: FrameRate.max,
          // ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ChangeNotifierProvider(
                    create: (context) => PlayerModel(),
                    builder: (context, child) => Player(),
                  ),
                ),
              );
            },
            child: const Text('Player'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ChangeNotifierProvider(
                    create: (context) => Numbers(),
                    builder: (context, child) => Game(),
                  ),
                ),
              );

              //Game();
            },
            child: const Text('Caller'),
          )
        ],
      ),
    ));
  }
}
