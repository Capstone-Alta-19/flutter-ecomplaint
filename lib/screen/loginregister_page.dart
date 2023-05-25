import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/account_question_button.dart';

class LoginregisterPage extends StatelessWidget {
  const LoginregisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool btnenable = true;
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/logo-mulai-complaint.png'),
              const Padding(padding: EdgeInsets.only(top: 62.28)),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.btnenable),
                  fixedSize: const MaterialStatePropertyAll(Size(357, 40)),
                ),
                onPressed: btnenable ? () {} : null,
                child: const Text("Buat Akun Baru"),
              ),
              AccountQuestionButton(
                text: "Sudah Punya Akun,",
                btnText: "Masuk",
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
