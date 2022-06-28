import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "title",
      transitionOnUserGestures: true,
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: const TextStyle(
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic)),
              ]),
        ),
      ),
    );
  }
}
