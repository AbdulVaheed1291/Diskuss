import 'package:flutter/material.dart';

class CircleAvatarComponent extends StatelessWidget {
  final double? radius;
  final Color? avatarColor;
  final IconData? icon;

  const CircleAvatarComponent({
    Key? key,
    this.radius,
    this.avatarColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: avatarColor,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}