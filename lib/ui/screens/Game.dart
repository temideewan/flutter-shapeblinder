import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);
  final String _text = "Game screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(_text)));
  }
}
