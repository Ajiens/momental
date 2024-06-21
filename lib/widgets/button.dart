import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  Text label;
  Icon? icon;
  VoidCallback tapFunction;
  Color color;

  CustomButton({Key? key,
  this.icon,
  required this.label,
  required this.color,
  required this.tapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const Text(""),
            SizedBox(width: 8),
            label
          ],
        ),
      ),
    );
  }
}