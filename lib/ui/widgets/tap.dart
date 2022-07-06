import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Tap extends StatefulWidget {
  const Tap({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Tap> createState() => _TapState();
}

class _TapState extends State<Tap> {
  int high = 0;

  void loadHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      high = prefs.getInt('High') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadHighScore();
    return Center(
        child: Column(children: <Widget>[
      SizedBox(
          height: 75.0,
          child: SvgPicture.asset(
            "assets/svg/tap.svg",
            semanticsLabel: "tap icon",
          )),
      const SizedBox(height: 14.0),
      Text(widget.title,
          style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
      Text("Best score: $high", style: Theme.of(context).textTheme.bodyText2)
    ]));
  }
}
