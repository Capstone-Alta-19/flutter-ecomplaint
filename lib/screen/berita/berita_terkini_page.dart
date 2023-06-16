import 'package:complainz/screen/berita/detail_berita_page.dart';
import 'package:flutter/material.dart';

import '../../config/app_color.dart';
import '../../widget/custom_card.dart';
import '../../widget/segment_title.dart';

class BeritaTerkiniPage extends StatefulWidget {
  BeritaTerkiniPage({super.key});

  GlobalKey keyBeritaTerkiniItem = GlobalKey();

  @override
  State<BeritaTerkiniPage> createState() => _BeritaTerkiniPageState();
}

class _BeritaTerkiniPageState extends State<BeritaTerkiniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                const SegmentTitleTwoLine(title: "Berita Terkini"),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey,
                        ),
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Image.asset(fit: BoxFit.cover, "assets/images/Gambar.png"),
                            Positioned(
                              width: MediaQuery.of(context).size.width - 30,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.accent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.primary), "Pemasangan AC Baru gedung G"),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: const [
                                            Text(style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary), "Sarana dan Prasarana"),
                                            VerticalDivider(
                                              width: 16,
                                              color: AppColors.primary,
                                              thickness: 1,
                                            ),
                                            Text(style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary), "2 menit yang lalu"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(alignment: Alignment.centerLeft, child: const Text(style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.primary), "Terbaru")),
                      const SizedBox(
                        height: 18,
                      ),
                      ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BeritaItem(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return const DetailBerita();
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
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BeritaItem extends StatelessWidget {
  final void Function() onPressed;
  const BeritaItem({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
            child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 96,
                    height: 96,
                    child: Image.asset(fit: BoxFit.cover, "assets/images/Gambar.png")),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: const Text(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary), "Pemasangan AC Baru gedung G")),
                        Container(alignment: Alignment.centerLeft, child: const Text(style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.primary), "2 menit berlalu")),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: InkWell(onTap: onPressed, child: const Text(style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primary), "Selengkapnya")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
