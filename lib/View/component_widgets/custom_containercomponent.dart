import 'package:flutter/material.dart';

class Containercomponent extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? containerColor;
  final IconData? icon;
  final String? text;
  final Color? textColor;
  final Color? iconColor;
  final bool? border;
  final Color? borderColor;
  final FontWeight? textFontWeight;

  const Containercomponent({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
    this.containerColor,
    this.icon,
    this.text,
    this.textColor,
    this.iconColor,
    this.border,
    this.borderColor,
    this.textFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        border: border == true
            ? Border.all(color: borderColor ?? Colors.transparent)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text ?? "",
            style: TextStyle(
              color: textColor,
              fontWeight: textFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}