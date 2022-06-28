import 'package:flutter/material.dart';
import 'package:shapeblinder/ui/widgets/layout.dart';
import 'package:shapeblinder/ui/widgets/logo.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);
  final String _text = "Game screen";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Layout(children: [Logo(subtitle: "let's play", title: _text)])),
    );
  }
}
