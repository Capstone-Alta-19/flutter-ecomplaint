import 'package:complainz/config/app_color.dart';
import 'package:complainz/model/api/register_api.dart';
import 'package:complainz/screen/complainz/create_account_screen.dart';
import 'package:complainz/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import '../login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State createState() {
    return _RegisterPageState();
  }
  //State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controllerUsername = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerNomor = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPasswordRepeat = TextEditingController();

  bool _obsecureText = true;
  bool _isFormFilled = false;
  bool _passwordMatch = true;

  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerNomor.dispose();
    controllerPassword.dispose();
    controllerPasswordRepeat.dispose();
    super.dispose();
  }

  void _checkPasswordMatch() {
    setState(() {
      _passwordMatch = controllerPassword.text == controllerPasswordRepeat.text;
    });
  }

  void _checkFormStatus() {
    setState(() {
      _isFormFilled = controllerUsername.text.isNotEmpty;
      _isFormFilled = controllerEmail.text.isNotEmpty;
      _isFormFilled = controllerNomor.text.isNotEmpty;
      _isFormFilled = controllerPassword.text.isNotEmpty;
      _isFormFilled = controllerPasswordRepeat.text.isNotEmpty;
    });
  }

  void _submitForm() async {
    await postData(controllerUsername.text, controllerEmail.text, controllerNomor.text, controllerPassword.text, controllerPasswordRepeat.text).then((value) {
      print(value);
    });

    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const CreateAccount();
          },
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
  }

  @override
  Widget build(BuildContext context) {
    //final userProvider = Provider.of<RegisterPage>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        //backgroundColor: const Color(0XFF58FF3E),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    'Buat akun baru \n dan mulai',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.font,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Selamat bergabung, buat sebuah akun agar dapat \n komplain lebih mudah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.font,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controllerUsername,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Kampus',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                          validator: (email) {
                            if (email != null && !EmailValidator.validate(email)) {
                              return 'Enter a Email valid';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controllerNomor,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nomor tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nomor WhatsApp',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controllerPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password belum diisi';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obsecureText = !_obsecureText;
                                  });
                                },
                                child: Icon(
                                  _obsecureText ? Icons.visibility : Icons.visibility_off,
                                ),
                              )),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: _obsecureText,
                          controller: controllerPasswordRepeat,
                          onChanged: (value) {
                            _checkFormStatus();
                            _checkPasswordMatch();
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Masukkan Kembali Password',
                            errorText: _passwordMatch ? null : 'Password tidak cocok',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          children: [
                            ButtonPrimary(
                              onPressed: _isFormFilled ? _submitForm : null,
                              btnText: 'Daftar',
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Sudah Punya Akun? ',
                                    style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return const LoginPage();
                                            },
                                            transitionDuration: const Duration(milliseconds: 300),
                                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
                                      'Masuk',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
