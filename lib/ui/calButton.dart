import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {

  final color;
  final textColor;
  final String buttonText;
  final buttonOnTapped;


  const CalButton({super.key, this.color, this.textColor, required this.buttonText, this.buttonOnTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonOnTapped,
      child: Padding(
        padding: const EdgeInsets.all(10.00),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 30
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


