import 'package:complainz/config/app_color.dart';
import 'package:complainz/widget/buttons.dart';
import 'package:flutter/material.dart';

class LaporanTerbuka extends StatefulWidget {
  const LaporanTerbuka({super.key});

  @override
  State<LaporanTerbuka> createState() => _LaporanTerbukaState();
}

class _LaporanTerbukaState extends State<LaporanTerbuka> {
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 100), //top: 246.59
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/icons/Checkmark.png',
                width: 170.76,
              ),
            ),
            const Text(
              'Selesai, Laporan \n Terkirim',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 63),
            const Text(
              'Share to',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 66.11, right: 66.11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.outer,
                                  color: Color.fromRGBO(0, 0, 0, 0.25))
                            ]),
                        child: Image.asset(
                          'assets/icons/Instagram.png',
                          width: 48.18,
                        ),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.outer,
                                  color: Color.fromRGBO(0, 0, 0, 0.25))
                            ]),
                        child: Image.asset('assets/icons/Facebook.png',
                            width: 48.18),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.outer,
                                  color: Color.fromRGBO(0, 0, 0, 0.25))
                            ]),
                        child: Image.asset('assets/icons/Whatsapp.png',
                            width: 48.18),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.outer,
                                  color: Color.fromRGBO(0, 0, 0, 0.30))
                            ]),
                        child: Image.asset('assets/icons/Twitter.png',
                            width: 48.18),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 155.98),
            ButtonPrimary(
              onPressed: () {},
              btnText: 'Lihat Laporan',
            ),
          ],
        ),
      ),
    );
  }
}
