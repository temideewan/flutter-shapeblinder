import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

class Tap extends StatelessWidget {
  const Tap({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      SizedBox(
          height: 75.0,
          child: SvgPicture.asset(
            "assets/svg/tap.svg",
            semanticsLabel: "tap icon",
          )),
      const SizedBox(height: 14.0),
      Text(title, style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
      Text("Best score: 0", style: Theme.of(context).textTheme.bodyText2)
    ]));
  }
}
