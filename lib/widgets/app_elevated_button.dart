import 'package:credit_calculator_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppElevatedButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final Color buttonColor;
  final Color textColor;

  const AppElevatedButton(
      {super.key,
        required this.text,
        required this.onPressed, required this.buttonColor, required this.textColor});

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 350.0,
        child: ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
            MaterialStateProperty.all<Color>(widget.buttonColor),
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
