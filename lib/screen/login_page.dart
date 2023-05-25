import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/account_question_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = true;

  TextEditingController _usernameEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                "Selamat Datang Kembali"),
            const Padding(padding: EdgeInsets.only(top: 24)),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
                "Complainz sudah menantikan kamu, ayo mulai laporkan keadaan terkini."),
            const Padding(padding: EdgeInsets.only(top: 24)),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary),
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary),
                  hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.primary)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.primary)),
                  labelText: 'Username/Email ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary),
                controller: _passwordController,
                obscureText: _passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary),
                  hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.primary)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.primary)),
                  labelText: 'Password',
                ),
              ),
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.btnenable),
                fixedSize: const MaterialStatePropertyAll(Size(357, 40)),
              ),
              onPressed: () {},
              child: const Text(style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.secondary100), "Masuk"),
            ),
            AccountQuestionButton(text: "Belum Punya Akun, ", btnText: "Daftar Sekarang", onPressed: () {}, textColor: AppColors.fontsecondary)
          ],
        ),
      ),
    );
  }
}
