import 'package:flutter/material.dart';
import 'package:shapeblinder/core/haptic_utilities.dart';
import 'package:shapeblinder/ui/widgets/layout.dart';
import 'package:shapeblinder/ui/widgets/logo.dart';
import 'package:shapeblinder/ui/widgets/tap.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            lightHaptic();
            Navigator.pushNamed(context, "/game");
          },
          child: const Layout(children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Logo(title: "shapeblinder", subtitle: "A game with the lights off"),
            Spacer(),
            Tap(title: "Tap anywhere to start")
          ])),
    );
  }
}
