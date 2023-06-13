import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/app_color.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  void _submitForm() {
    if (_isFormFilled) {}
  }

  bool _isFormFilled = false;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  void _checkFormStatus() {
    setState(() {
      _isFormFilled = controller1.text.isNotEmpty;
      _isFormFilled = controller2.text.isNotEmpty;
      _isFormFilled = controller3.text.isNotEmpty;
      _isFormFilled = controller4.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios),
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 13.0),
            child: Column(
              children: [
                Text(
                  'Masukkan kode verifikasi',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0XFF3C486B),
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Kami telah mengirim kode verifikasi, \n periksa pesan masuk anda',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: const Color(0XFF3C486B),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 70,
                        height: 90,
                        child: TextFormField(
                          controller: controller1,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: '-',
                            hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 70,
                        height: 90,
                        child: TextFormField(
                          controller: controller2,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: '-',
                            hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 70,
                        height: 90,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller3,
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: '-',
                            hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 70,
                        height: 90,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller4,
                          onChanged: (value) {
                            _checkFormStatus();
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: '-',
                            hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '5:00',
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(60, 72, 107, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Kirim ulang',
                  style: GoogleFonts.poppins(
                    color: const Color(0XFF1D1B20),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 21),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: FilledButton.tonal(
                    onPressed: _isFormFilled ? _submitForm : null,
                    child: Text(
                      'Verifikasi',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(358, 40),
                      backgroundColor: AppColors.primary,
                    ),
                  ),
                ),
                /*   Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ElevatedButton(
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
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
