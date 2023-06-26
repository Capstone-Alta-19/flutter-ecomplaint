import 'package:complainz/Provider/get_all_news_provider.dart';
import 'package:complainz/config/date_time.dart';
import 'package:complainz/screen/berita/detail_berita_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_color.dart';
import '../../widget/custom_card.dart';
import '../../widget/segment_title.dart';

// ignore: must_be_immutable
class BeritaTerkiniPage extends StatefulWidget {
  BeritaTerkiniPage({super.key});

  GlobalKey keyBeritaTerkiniItem = GlobalKey();

  @override
  State<BeritaTerkiniPage> createState() => _BeritaTerkiniPageState();
}

class _BeritaTerkiniPageState extends State<BeritaTerkiniPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetAllNewsViewModel>(context, listen: false).getResultAllNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetAllNewsViewModel>(context);
    String getCategory(int category) {
      String stringCateogries = "";
      if (category == 1) {
        stringCateogries = "Dosen dan Staff akademik";
        return stringCateogries;
      }
      if (category == 2) {
        stringCateogries = "Sarana dan Prasarana";
        return stringCateogries;
      }
      if (category == 3) {
        stringCateogries = "Sistem Perkuliahan";
        return stringCateogries;
      }
      if (category == 4) {
        stringCateogries = "Organisasi Mahasiswa";
        return stringCateogries;
      }
      if (category == 5) {
        stringCateogries = "Sesama Mahasiswa";
        return stringCateogries;
      } else {
        stringCateogries = "Lainnya";
      }
      return stringCateogries;
    }

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
                if (provider.isLoading) const SizedBox(height: 500, child: Center(child: CircularProgressIndicator())),
                if (!provider.isLoading && provider.allNews.isEmpty) const SizedBox(height: 500, child: Text("Berita Kosong")),
                if (!provider.isLoading && provider.allNews.isNotEmpty)
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
                              Image.network(width: MediaQuery.of(context).size.width, fit: BoxFit.cover, provider.allNews[0].photoUrl),
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
                                        Text(style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.primary), provider.allNews[0].newsName),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Text(style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary), getCategory(provider.allNews[0].id)),
                                              const VerticalDivider(
                                                width: 16,
                                                color: AppColors.primary,
                                                thickness: 1,
                                              ),
                                              Text(style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary), provider.allNews[0].createdAt.timeAgo(numericDates: false)),
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
                          itemCount: provider.allNews.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            final result = provider.allNews[index];
                            return BeritaItem(
                              gambar: result.photoUrl,
                              time: result.createdAt.timeAgo(numericDates: false),
                              deskripsi: result.newsName,
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return DetailBerita(
                                          id: result.id,
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
  final String deskripsi;
  final String gambar;
  final String time;
  final void Function() onPressed;
  const BeritaItem({super.key, required this.onPressed, required this.deskripsi, required this.gambar, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: CustomCard(
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
                      child: Image.network(fit: BoxFit.cover, gambar)),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(alignment: Alignment.centerLeft, child: Text(style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary), deskripsi)),
                          Container(alignment: Alignment.centerLeft, child: Text(style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.primary), time)),
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
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
