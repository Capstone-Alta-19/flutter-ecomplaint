import 'package:complainz/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../config/app_color.dart';
import '../../model/auth.dart';
import '../../widget/account_question_button.dart';
import '../home_page.dart';
import '../laporan/berita_laporan_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;
  bool _isFormFilled = false;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;

    String date = "2023-06-11T23:22:13.944+07:00";
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
    print(formattedDate);
  }

  void _checkFormStatus() {
    setState(() {
      _isFormFilled = usernameEmailController.text.isNotEmpty;
      _isFormFilled = passwordController.text.isNotEmpty;
    });
  }

  void _submitForm() async {
    await login(usernameEmailController.text, passwordController.text)
        .then((value) {
      if (value == LoginStatus.success) {
        Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const Homepage();
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
      } else {
        print(value);
      }
    });
  }

  @override
  void dispose() {
    usernameEmailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const ImageIcon(AssetImage("assets/icons/arrow-back.png")),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColors.font,
                    ),
                    "Selamat Datang Kembali"),
                const Padding(padding: EdgeInsets.only(top: 24)),
                const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.font,
                    ),
                    "Complainz sudah menantikan kamu, ayo mulai laporkan keadaan terkini."),
                const Padding(padding: EdgeInsets.only(top: 24)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: TextFormField(
                    controller: usernameEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username/Email tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _checkFormStatus();
                    },
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.font),
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.font),
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.font),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary)),
                      labelText: 'Username/Email ',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _checkFormStatus();
                    },
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.font),
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.font),
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.font),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.primary)),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FilledButton.tonal(
                  style: ButtonStyle(
                    backgroundColor: _isFormFilled
                        ? MaterialStateProperty.all(AppColors.font)
                        : null,
                    fixedSize: const MaterialStatePropertyAll(Size(357, 40)),
                  ),
                  onPressed: _isFormFilled ? _submitForm : null,
                  child: _isFormFilled
                      ? const Text(
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary100),
                          "Masuk")
                      : const Text(
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          "Masuk"),
                ),
                AccountQuestionButton(
                    text: "Belum Punya Akun, ",
                    btnText: "Daftar Sekarang",
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const RegisterPage();
                            },
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                    textColor: AppColors.fontsecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
