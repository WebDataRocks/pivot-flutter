import 'package:flutter/material.dart';

class Log extends StatelessWidget {
  const Log({super.key, required this.eventName});

  final String eventName;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "Last event:\n" + eventName,
          style: TextStyle(color: Colors.white)),
    );
  }
}
