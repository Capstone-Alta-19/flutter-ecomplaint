import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';
import 'package:flutter_ecomplaint/widget/custom_card.dart';
import 'package:flutter_ecomplaint/widget/isi_laporan_item.dart';
import 'package:flutter_ecomplaint/widget/profile_card.dart';
import 'package:flutter_ecomplaint/widget/segment_title.dart';
import 'package:like_button/like_button.dart';

class IsiBeritaLaporanPage extends StatefulWidget {
  const IsiBeritaLaporanPage({super.key});

  @override
  State<IsiBeritaLaporanPage> createState() => _IsiBeritaLaporanPageState();
}

class _IsiBeritaLaporanPageState extends State<IsiBeritaLaporanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                const SegmentTitle(title: "Laporan"),
                const SizedBox(
                  height: 87.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomCard(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.5,
                      right: 10.5,
                      top: 20.5,
                      bottom: 12.5,
                    ),
                    child: Column(
                      children: [
                        const ProfileCard(),
                        const SizedBox(height: 8),
                        const IsiLaporanItem(),
                        const SizedBox(height: 8),
                        OutlinedButton(
                          style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 40))),
                          onPressed: () {},
                          child: const Text(
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.fontsecondary,
                              ),
                              "Selengkapnya"),
                        ),
                      ],
                    ),
                  )),
                ),
                const SizedBox(height: 13.0),
                Padding(
                    padding: const EdgeInsets.only(left: 32, right: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  LikeButton(
                                    size: 24,
                                    circleColor: const CircleColor(start: Colors.redAccent, end: Colors.redAccent),
                                    bubblesColor: const BubblesColor(
                                      dotPrimaryColor: Colors.redAccent,
                                      dotSecondaryColor: Colors.redAccent,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        isLiked ? Icons.favorite : Icons.favorite_outline,
                                        color: isLiked ? Colors.redAccent : AppColors.primary,
                                        size: 24,
                                      );
                                    },
                                  ),
                                  GestureDetector(
                                    child: Icon(size: 24, Icons.chat_outlined),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Icon(size: 24, Icons.share),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                            LikeButton(
                              size: 24,
                              circleColor: const CircleColor(start: AppColors.primary, end: AppColors.primary),
                              bubblesColor: const BubblesColor(
                                dotPrimaryColor: AppColors.primary,
                                dotSecondaryColor: AppColors.primary,
                              ),
                              likeBuilder: (bool isBookmark) {
                                return Icon(
                                  isBookmark ? Icons.bookmark : Icons.bookmark_add_outlined,
                                  color: isBookmark ? AppColors.primary : AppColors.primary,
                                  size: 24,
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.font), text: "200 "),
                            TextSpan(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.font), text: "Likes"),
                          ]),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
