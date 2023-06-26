import 'package:complainz/screen/status/riwayat_laporan_page.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:provider/provider.dart';
import '../config/app_color.dart';
import '../Provider/bottom_navbar_provider.dart';
import 'buatlaporan/laporkan_screen.dart';
import 'home_page.dart';
import 'myAccount/my_account_page.dart';

// ignore: must_be_immutable
class BottomNavigationBrWidget extends StatelessWidget {
  int _selectedIndex = 0;

  final List<Widget> pages = <Widget>[const Homepage(), const LaporkanPage(), const RiwayatLaporanPage(), const MyAccount()];
  BottomNavigationBrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarProvider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: pages[bottomNavigationBarProvider.currentIndex],
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
        selectedIndex: bottomNavigationBarProvider.currentIndex,
        onTabChange: (int index) => bottomNavigationBarProvider.currentIndex = index,
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
      /* bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationBarProvider.currentIndex,
        onTap: (int index) => bottomNavigationBarProvider.currentIndex = index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ), */
    );
  }
}
