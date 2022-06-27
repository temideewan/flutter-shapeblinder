import 'package:flutter/material.dart';

class Lost extends StatelessWidget {
  const Lost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Text(
      "You lost",
      style: TextStyle(color: Colors.red),
    )));
  }
}
