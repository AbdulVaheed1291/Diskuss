import 'package:flutter/material.dart';

class FloatingDialButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -30,
      left: MediaQuery.of(context).size.width / 2 - 30,
      child: GestureDetector(
        onTap: () {
          print("Floating dial button tapped");
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: const Icon(
            Icons.dialpad,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
