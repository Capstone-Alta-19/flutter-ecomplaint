import 'package:complainz/config/app_color.dart';
import 'package:complainz/screen/bottom_navbar.dart';
import 'package:complainz/Provider/bottom_navbar_provider.dart';
import 'package:complainz/screen/home_page.dart';
import 'package:complainz/screen/login/login_page.dart';
import 'package:complainz/screen/my_account_screen.dart';
import 'package:complainz/screen/pengaduan_screen.dart';
import 'package:complainz/screen/status/status_complaint_page.dart';
import 'package:complainz/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:provider/provider.dart';

class LaporkanPage extends StatefulWidget {
  const LaporkanPage({super.key});

  @override
  State<LaporkanPage> createState() => _LaporkanPageState();
}

class _LaporkanPageState extends State<LaporkanPage> {
  int _selectedIndex = 0;
  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 111, right: 16),
              child: Text(
                'Pengaduan!',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 69.35),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Cards(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PengaduanPage()));
                  },
                  assets: Image.asset(
                    'assets/images/pengaduan.png',
                    fit: BoxFit.cover,
                  ),
                  flex1: 1,
                  flex2: 2,
                  cardText: 'Pengaduan',
                  paddingImage: const EdgeInsets.only(left: 10),
                  paddingText: const EdgeInsets.only(left: 24, right: 10),
                )),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CustomCards(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AspirasiPage()));
                  },
                  flexText: 2,
                  flexImage: 1,
                  assets: Image.asset(
                    'assets/images/aspirasi.png',
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(height: 99.5),
            const Text(
              'Pilih Kategori \n Laporan',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      )),
      /* bottomNavigationBar: MoltenBottomNavigationBar(
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
      ), */ //extendBody: screens[currentScreenIndex],

      /* bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            print('Selected $index');
          },
          selectedIndex: 0,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              //selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.home),
              label: '',
            ),
            NavigationDestination(
              //selectedIcon: Icon(Icons.engineering),
              icon: Icon(Icons.add_comment_rounded),
              label: '',
            ),
            NavigationDestination(
              //selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.verified_user_outlined),
              label: '',
            ),
            NavigationDestination(
              //selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.account_box_outlined),
              label: '',
            ),
          ],
        ),
      ), */
    );
  }
}
