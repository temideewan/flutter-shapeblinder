import 'package:flutter/material.dart';
import 'package:shapeblinder/ui/widgets/layout.dart';
import 'package:shapeblinder/ui/widgets/logo.dart';
import 'package:shapeblinder/ui/widgets/tap.dart';

class Lost extends StatelessWidget {
  const Lost({Key? key}) : super(key: key);

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
            Logo(title: "Tou lost", subtitle: "score: 0"),
            Spacer(),
            Tap(title: "Tap anywhere to start again")
          ])),
    );
  }
}
