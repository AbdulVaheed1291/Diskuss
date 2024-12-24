import 'package:flutter/material.dart';
import 'text_component.dart';

class RemindersHeader extends StatelessWidget {
  const RemindersHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: const [
          TextComponent(
            text: "Reminders",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          Spacer(),
          TextComponent(
            text: "See all",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
