import 'package:flutter/material.dart';
import 'package:complainz/widget/segment_title.dart';

import '../../config/app_color.dart';
import '../../widget/custom_card.dart';

class DetailBerita extends StatelessWidget {
  const DetailBerita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Center(
              child: Column(
                children: [
                  const SegmentTitle(title: ""),
                  SizedBox(
                    height: 43.5,
                  ),
                  const Center(
                    child: Text(
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: AppColors.font,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                      "Pemasangan AC Baru Gedung G",
                    ),
                  ),
                  const Center(
                    child: Text(
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.font,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                      "Admin 1 | Sarana & Prasarana",
                    ),
                  ),
                  const Center(
                    child: Text(
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.font,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                      "20 Juni 2023",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 360,
                    child: Image.asset(
                        fit: BoxFit.fill, 'assets/images/Gambar.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.font,
                          fontFamily: 'Poppins'),
                      textAlign: TextAlign.justify,
                      """Rorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.
                      \nCurabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.
                      """,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 28),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColors.font),
                            "Baca Juga")),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8,
                      ),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => DetailBeritaItem(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class DetailBeritaItem extends StatelessWidget {
  const DetailBeritaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CustomCard(
              child: SizedBox(
            width: 283,
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
                      child: Image.asset(
                          fit: BoxFit.cover, "assets/images/Gambar.png")),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary),
                                    "Pemasangan AC Baru gedung G")),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary),
                                  "Selengkapnya",
                                  maxLines: 3),
                            ),
                          ],
                        ),
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
