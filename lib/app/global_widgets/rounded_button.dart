import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color, textColor;
  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 100, 181, 246),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: Get.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            backgroundColor: color,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: Get.width < 360
                  ? 15.0
                  : Get.width < 720
                      ? 24
                      : 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
