import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(10),
      iconSize: 28,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.grey.shade800.withValues(alpha: 0.5),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
      ),
      icon: icon,
      color: Colors.white,
      onPressed: () {},
    );
  }
}
