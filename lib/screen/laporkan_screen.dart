import 'package:complainz/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaporkanPage extends StatefulWidget {
  const LaporkanPage({super.key});

  @override
  State<LaporkanPage> createState() => _LaporkanPageState();
}

class _LaporkanPageState extends State<LaporkanPage> {
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
              SizedBox(height: 69.35),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/pengaduan.png',
                            fit: BoxFit.cover,
                            width: 106,
                            height: 99.7,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(left: 24, right: 10),
                          child: Text(
                            'Pengaduan',
                            style: GoogleFonts.poppins(
                              color: AppColor.font,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(left: 48),
                          child: Text(
                            'Aspirasi',
                            style: GoogleFonts.poppins(
                              color: AppColor.font,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/aspirasi.png',
                            fit: BoxFit.cover,
                            width: 106,
                            height: 99.7,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 99.5),
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
        ),
      ),
      bottomNavigationBar: NavigationBar(
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
    );
  }
}
