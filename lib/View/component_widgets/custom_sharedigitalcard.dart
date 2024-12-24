import 'package:flutter/material.dart';

class CustomSharedigitalcard extends StatelessWidget {
  const CustomSharedigitalcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white, // Default container color
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff010640)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.share, // Default icon
            color: const Color(0xff010640),
          ),
          const SizedBox(width: 8),
          const Text(
            'Share Digital',
            style: TextStyle(
              color: Color(0xff010640),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
