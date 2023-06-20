import 'package:complainz/config/app_color.dart';
import 'package:complainz/widget/buttons.dart';
import 'package:flutter/material.dart';

class GantiPassword extends StatefulWidget {
  const GantiPassword({super.key});

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  final controllerPassword = TextEditingController();
  final controllerPasswordRepeat = TextEditingController();

  bool _obsecureText = true;
  bool _passwordMatch = true;

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerPasswordRepeat.dispose();
    super.dispose();
  }

  void _checkPasswordMatch() {
    setState(() {
      _passwordMatch = controllerPassword.text == controllerPasswordRepeat.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ImageIcon(
              size: 50,
              AssetImage(
                'assets/icons/BACK.png',
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 161)),
                  Text(
                    'Ganti \n Password',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controllerPassword,
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
                    const SizedBox(height: 38),
                    TextFormField(
                      obscureText: _obsecureText,
                      controller: controllerPasswordRepeat,
                      onChanged: (value) {
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
                    )
                  ],
                ),
              ),
              const SizedBox(height: 380),
              ButtonPrimary(
                btnText: 'Simpan',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
