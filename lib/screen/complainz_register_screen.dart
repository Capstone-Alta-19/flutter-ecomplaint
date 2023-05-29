import 'package:complainz/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:complainz/model/post.dart';
import 'package:complainz/notifiers/post_notifier.dart';

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
  Post _post = new Post();

  _showSnackBar(String text, BuildContext context) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _createPost(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      _showSnackBar("Failed to Create Post", context);
      return;
    }

    formKey.currentState!.save();
    //_post.username = admin;

    PostNotifier postNotifier = Provider.of(context, listen: false);
    //_post.username = postNotifier.getPostList().length + 1;
    _post.phone = postNotifier.getPostList().length.toString();
    postNotifier.uploadPost(_post).then((value) {
      if (value) {
        _showSnackBar("Post added Succesfully", context);
      }
    });
  }

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

  void _submitForm() {
    _createPost(context);
    /* if (_isFormFilled) {
      /* if (formKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
      } */
      /* Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpPage())); */
      final username = controllerUsername.text;
      final email = controllerEmail.text;
      final phone = controllerNomor.text;
      final password = controllerPassword.text;
      final commplainz = Complainz(
          username: username, email: email, phone: phone, password: password);
      userProvider.registerUser();
    } */
  }

  @override
  Widget build(BuildContext context) {
    //final userProvider = Provider.of<RegisterPage>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        //backgroundColor: const Color(0XFF58FF3E),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    'Buat akun baru \n dan mulai',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColor.font,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Selamat bergabung, buat sebuah akun agar dapat \n komplain lebih mudah',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0XFF3C486B),
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
                          onSaved: (String? value) {
                            _post.username;
                          },
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Username',
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF3C486B),
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
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Email Kampus',
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF3C486B),
                            ),
                          ),
                          validator: (email) {
                            if (email != null &&
                                !EmailValidator.validate(email)) {
                              return 'Enter a Email valid';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String? value) {
                            _post.email;
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
                          onSaved: (String? value) {
                            _post.phone;
                          },
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Nomor WhatsApp',
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF3C486B),
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
                          onSaved: (String? value) {
                            _post.password;
                          },
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0XFF3C486B),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obsecureText = !_obsecureText;
                                  });
                                },
                                child: Icon(
                                  _obsecureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          controller: controllerPasswordRepeat,
                          onChanged: (value) {
                            _checkFormStatus();
                            _checkPasswordMatch();
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Masukkan Kembali Password',
                            errorText:
                                _passwordMatch ? null : 'Password tidak cocok',
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF3C486B),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          children: [
                            FilledButton.tonal(
                              onPressed: _isFormFilled ? _submitForm : null,
                              child: Text(
                                'Daftar',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(358, 40),
                                backgroundColor: AppColor.font,
                              ),
                            ),
                            /* ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Daftar',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(29, 27, 32, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0XFFE5E5E5),
                                shadowColor: const Color(0XFFE5E5E5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                minimumSize: const Size(358, 40),
                              ),
                            ), */
                            const SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sudah Punya Akun? ',
                                    style: GoogleFonts.poppins(
                                        color: AppColor.font,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //Get.to(() => const RegisterPage());
                                    },
                                    child: const Text(
                                      'Masuk',
                                      style: TextStyle(
                                        color: AppColor.font,
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
