import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children),
              padding: const EdgeInsets.all(4.0))),
    );
  }
}
