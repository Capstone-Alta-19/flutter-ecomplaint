import 'package:flutter/material.dart';

class AccountQuestionButton extends StatelessWidget {
  const AccountQuestionButton({Key? key, required this.text, required this.btnText, required this.onPressed, required this.textColor}) : super(key: key);
  final String text;
  final String btnText;
  final Color textColor;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              text: text,
            ),
            TextSpan(
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              text: btnText,
            ),
          ],
        ),
      ),
    );
  }
}
