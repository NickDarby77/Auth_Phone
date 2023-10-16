import 'package:flutter/material.dart';

class SmallCircleWidget extends StatelessWidget {
  const SmallCircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..translate(1.5, 100.0),
      child: Container(
        width: 202,
        height: 202,
        decoration: const ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
