import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  final double height;
  final double width;

  const MessageDisplay({
    super.key,
    required this.message,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      margin: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Text(
          message,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
