import 'package:complainz/config/app_color.dart';
import 'package:complainz/screen/ganti_profile_page.dart';
import 'package:complainz/screen/komplain_tersimpan.dart';
import 'package:complainz/screen/login/loginregister_page.dart';
import 'package:complainz/screen/status/riwayat_laporan_page.dart';
import 'package:complainz/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register/ganti_password.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/background.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 71),
                      child: Image.asset(
                        'assets/images/Profile_account.png',
                        width: 145,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 22),
            Column(
              children: [
                const Text(
                  'John Doe',
                  style: TextStyle(color: AppColors.primary, fontSize: 40, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 366,
                  height: 72,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '20',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Laporan',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                          child: VerticalDivider(
                            color: AppColors.primary,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '2',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Diterima',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                          child: VerticalDivider(
                            color: AppColors.primary,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '1',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Diproses',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                          child: VerticalDivider(
                            color: AppColors.primary,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '2',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Dijawab',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      //color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 30,
                        )
                      ]),
                  width: 353,
                  height: 352,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Padding(padding: EdgeInsets.only(top: 28)),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const KomplainTersimpan()));
                          },
                          child: Row(
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 26)),
                              ImageIcon(AssetImage('assets/icons/Pin_Icon.png')),
                              Padding(padding: EdgeInsets.only(left: 30)),
                              Text(
                                'Complain Tersimpan',
                                style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 36),
                        Image.asset('assets/icons/Divider.png'),
                        const SizedBox(height: 36),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return const RiwayatLaporanPageFromAccount();
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
                          child: Row(
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 26)),
                              ImageIcon(AssetImage('assets/icons/Date_icon.png')),
                              Padding(padding: EdgeInsets.only(left: 30)),
                              Text(
                                'Riwayat Laporan Saya',
                                style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 36),
                        Image.asset('assets/icons/Divider.png'),
                        const SizedBox(height: 36),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => GantiProfile()));
                          },
                          child: Row(
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 26)),
                              ImageIcon(AssetImage('assets/icons/Profile_icon.png')),
                              Padding(padding: EdgeInsets.only(left: 30)),
                              Text(
                                'Ubah Profile',
                                style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 36),
                        Image.asset('assets/icons/Divider.png'),
                        const SizedBox(height: 36),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const GantiPassword()));
                          },
                          child: Row(
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 26)),
                              ImageIcon(AssetImage('assets/icons/Lock_icon.png')),
                              Padding(padding: EdgeInsets.only(left: 30)),
                              Text(
                                'Ganti Password',
                                style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 366,
                  height: 72,
                  child: Card(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Padding(padding: EdgeInsets.only(left: 34)),
                        ImageIcon(AssetImage('assets/icons/Info_icon.png')),
                        Padding(padding: EdgeInsets.only(left: 30)),
                        Text(
                          'Tentang Kami',
                          style: TextStyle(color: AppColors.primary, fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 12, right: 12)),
                    ButtonLogout(
                      btnText: 'Logout',
                      onPressed: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        await preferences.remove('token').then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginregisterPage())));
                      },
                    ),
                    ButtonDelete(
                      btnText: 'Hapus Akun',
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
