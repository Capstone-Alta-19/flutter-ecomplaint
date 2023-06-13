import 'package:complainz/config/app_color.dart';
import 'package:complainz/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  int _selectedIndex = 0;

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
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
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
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 26)),
                            ImageIcon(AssetImage('assets/icons/Pin_Icon.png')),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text(
                              'Complain Tersimpan',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        const SizedBox(height: 36),
                        Image.asset('assets/icons/Divider.png'),
                        const SizedBox(height: 36),
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 26)),
                            ImageIcon(AssetImage('assets/icons/Date_icon.png')),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text(
                              'Complain Tersimpan',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 36),
                        Image.asset('assets/icons/Divider.png'),
                        const SizedBox(height: 36),
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 26)),
                            ImageIcon(
                                AssetImage('assets/icons/Profile_icon.png')),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text(
                              'Complain Tersimpan',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 36),
                        Image.asset('assets/icons/Divider.png'),
                        const SizedBox(height: 36),
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 26)),
                            ImageIcon(AssetImage('assets/icons/Lock_icon.png')),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text(
                              'Complain Tersimpan',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
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
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 12, right: 12)),
                    ButtonLogout(
                      btnText: 'Logout',
                      onPressed: () {},
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
      bottomNavigationBar: MoltenBottomNavigationBar(
        borderRaduis: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        barHeight: 80,
        domeCircleSize: 36,
        domeWidth: 100,
        domeHeight: 10,
        domeCircleColor: AppColors.secondary100,
        barColor: AppColors.secondary100,
        borderColor: Colors.black12,
        borderSize: 2,
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            selectedColor: AppColors.primary,
            icon: Image.asset('assets/icons/Home.png'),
          ),
          MoltenTab(
            selectedColor: AppColors.primary,
            icon: Image.asset('assets/icons/Chat_alt_add.png'),
          ),
          MoltenTab(
            selectedColor: AppColors.primary,
            icon: Image.asset('assets/icons/Shield.png'),
          ),
          MoltenTab(
            selectedColor: AppColors.primary,
            icon: Image.asset('assets/icons/User.png'),
          ),
        ],
      ),
    );
  }
}
