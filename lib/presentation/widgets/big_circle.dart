import 'package:flutter/material.dart';

class BigCircleWidget extends StatelessWidget {
  const BigCircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..translate(142.0, 551.0),
      child: Container(
        width: 270,
        height: 270,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF09F6FF),
              Color(0xFFFF00F4),
            ],
          ),
          shape: OvalBorder(),
        ),
      ),
    );
  }
}
