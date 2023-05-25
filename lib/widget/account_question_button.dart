import 'package:flutter/material.dart';
import '../config/colors.dart';

class AccountQuestionButton extends StatelessWidget {
  const AccountQuestionButton({Key? key, required this.text, required this.btnText, required this.onPressed}) : super(key: key);
  final String text;
  final String btnText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500), text),
        TextButton(
          style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
          onPressed: onPressed,
          child: Text(style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700), btnText),
        ),
      ],
    );
  }
}
