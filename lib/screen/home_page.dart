import 'package:carousel_slider/carousel_slider.dart';
import 'package:complainz/screen/berita/berita_terkini_page.dart';
import 'package:complainz/widget/selengkapnya_button.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../widget/custom_card.dart';
import 'laporan/berita_laporan_page.dart';
import 'laporan/isi_berita_laporan_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Widget> items = [
    Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Image.asset('assets/logo/banner1.png'),
    ),
    Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Image.asset('assets/logo/banner2.png'),
    ),
    Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Image.asset('assets/logo/banner3.png'),
    ),
  ];

  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),

        // leading: Image.asset("assets/logo/hd-logo-splash-screen.png"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            width: 176.57,
                            height: 36.35,
                            "assets/logo/hd-logo-splash-screen.png",
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              carouselIndex = index;
                            });
                          },
                        ),
                        items: items,
                      ),
                      DotsIndicator(
                        dotsCount: 3,
                        position: carouselIndex.toDouble(),
                        decorator: const DotsDecorator(
                            spacing: EdgeInsets.all(3),
                            size: Size(9.0, 9.0),
                            color: AppColors.primary20,
                            activeSize: Size(24.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            ),
                            activeColor: AppColors.primary),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      SelengkapnyaButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return BeritaTerkiniPage();
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
                        title: "Lihat Berita Terkini",
                      ),
                      const SizedBox(height: 27),
                      const Text(style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40, color: AppColors.primary), "Kategori"),
                      const SizedBox(height: 24),
                      GridView(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 25,
                          mainAxisExtent: 219,
                        ),
                        children: [
                          HomepageItem(
                              gambar: "assets/logo/homapage-1.png",
                              title: "Dosen dan Staf akademik",
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return const IsiBeritaLaporanPage(
                                          category: "1",
                                        );
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
                              }),
                          HomepageItem(
                              gambar: "assets/logo/homapage-2.png",
                              title: "Sarana dan Prasarana",
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return const IsiBeritaLaporanPage(
                                          category: "2",
                                        );
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
                              }),
                          HomepageItem(
                              gambar: "assets/logo/homapage-3.png",
                              title: "Sistem Perkuliahan",
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return const IsiBeritaLaporanPage(
                                          category: "3",
                                        );
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
                              }),
                          HomepageItem(
                              gambar: "assets/logo/homapage-4.png",
                              title: "Organisasi Mahasiswa",
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return IsiBeritaLaporanPage(category: "4");
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
                              }),
                        ],
                      ),
                      const SizedBox(height: 37),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: OutlinedButton.icon(
                          style: const ButtonStyle(shape: MaterialStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))))),
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return const BeritaLaporanPage();
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
                          icon: const ImageIcon(AssetImage("assets/icons/Expand_right.png")),
                          label: const Text(style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.primary), "Lihat Semua"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(right: 8, height: MediaQuery.of(context).size.height + 30, child: InkWell(child: Container(height: 90, width: 85, decoration: const BoxDecoration(shape: BoxShape.circle), child: Image.asset("assets/icons/Chat-live-button.png")))),
        ],
      ),
    );
  }
}

class HomepageItem extends StatelessWidget {
  final String gambar;
  final String title;
  final void Function() onPressed;
  const HomepageItem({super.key, required this.gambar, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: CustomCard(
          child: SizedBox(
        height: 219,
        width: 167,
        child: Column(
          children: [
            Image.asset(
              gambar,
              width: 160,
              height: 150,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Container(
                  decoration: const BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black12))),
                  height: 66,
                  child: Center(
                    child: Text(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                        title),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
