import 'package:complainz/config/app_color.dart';
import 'package:complainz/screen/pengaduan_screen.dart';
import 'package:complainz/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class LaporkanPage extends StatefulWidget {
  const LaporkanPage({super.key});

  @override
  State<LaporkanPage> createState() => _LaporkanPageState();
}

class _LaporkanPageState extends State<LaporkanPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 111, right: 16),
              child: Text(
                'Pengaduan!',
                style: GoogleFonts.poppins(
                  color: AppColor.font,
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
                    'assets/pengaduan.png',
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
                            builder: (context) => const PengaduanPage()));
                  },
                  flexText: 2,
                  flexImage: 1,
                  assets: Image.asset(
                    'assets/aspirasi.png',
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(height: 99.5),
            Text(
              'Pilih Kategori \n Laporan',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColor.font,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: MoltenBottomNavigationBar(
        domeCircleColor: Color(0XFFF0F0F0),
        barColor: Color(0XFFF0F0F0),
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
            selectedColor: Color(0XFF3C486B),
            icon: Icon(Icons.home),
          ),
          MoltenTab(
            selectedColor: Color(0XFF3C486B),
            icon: Icon(Icons.add_comment_rounded),
          ),
          MoltenTab(
            selectedColor: Color(0XFF3C486B),
            icon: Icon(Icons.verified_user_outlined),
          ),
          MoltenTab(
            selectedColor: Color(0XFF3C486B),
            icon: Icon(Icons.account_box_outlined),
          ),
        ],
      ),
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
