import 'package:flutter/material.dart';
import 'text_component.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;


  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlueAccent, Colors.lightBlueAccent],
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/d9/66/9f/d9669fb976dd6ad1039accb1dbf670d2.jpg"),
                  maxRadius: 25,
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextComponent(
                      text: 'Enterprise',
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    TextComponent(
                      text: 'Diskuss',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.notifications, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.settings, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
