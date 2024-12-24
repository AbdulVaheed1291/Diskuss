import 'package:flutter/material.dart';

class SizedBox extends StatelessWidget {
  final double? width; // Optional width
  final double? height; // Optional height

  // Constructor with default values
  const SizedBox({
    this.width,  // Optional width
    this.height, // Optional height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0.0,
      height: height ?? 0.0,
    );
  }
}
