import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final String icons;
  final String title;
  final press;
  final bool isActive;
  const BottomNav(
      {Key? key,
      required this.icons,
      required this.title,
      required this.press,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            icons,
            height: 30,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.blueAccent : Colors.black,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
