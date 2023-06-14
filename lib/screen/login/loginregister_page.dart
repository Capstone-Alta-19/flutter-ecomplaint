import 'package:complainz/screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../../config/app_color.dart';
import '../../widget/account_question_button.dart';
import 'login_page.dart';

class LoginregisterPage extends StatelessWidget {
  const LoginregisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  width: 307,
                  height: 133,
                  'assets/logo/hd-logo-mulai-complaint.png'),
              const Padding(padding: EdgeInsets.only(top: 62.28)),
              FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.btnenable),
                  fixedSize: const MaterialStatePropertyAll(Size(357, 40)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const RegisterPage();
                        },
                        transitionDuration: const Duration(milliseconds: 300),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final tween = Tween(
                            begin: const Offset(2, 0),
                            end: Offset.zero,
                          );
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        }),
                  );
                },
                child: const Text(
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary100),
                    "Buat Akun Baru"),
              ),
              AccountQuestionButton(
                textColor: AppColors.font,
                text: "Sudah Punya Akun, ",
                btnText: "Masuk",
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const LoginPage();
                        },
                        transitionDuration: const Duration(milliseconds: 300),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final tween = Tween(
                            begin: const Offset(2, 0),
                            end: Offset.zero,
                          );
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        }),
                  );
                },
              ),
            ],
          )),
    );
  }
}
