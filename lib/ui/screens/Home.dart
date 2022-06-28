import 'package:flutter/material.dart';
import 'package:shapeblinder/ui/widgets/Layout.dart';
import 'package:shapeblinder/ui/widgets/Logo.dart';
import 'package:shapeblinder/ui/widgets/Tap.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pushNamed(context, "/game");
            // TODO navigate to game screen
          },
          child: const Layout(children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Logo(title: "ShapeBlinder", subtitle: "A game with the lights off"),
            Spacer(),
            Tap(title: "Tap anywhere to start")
          ])),
    );
  }
}
