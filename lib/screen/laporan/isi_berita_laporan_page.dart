import 'dart:typed_data';

import 'package:complainz/Provider/get_complaint_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../config/app_color.dart';
import '../../widget/custom_card.dart';
import '../../widget/interaction_card.dart';
import '../../widget/isi_laporan_item.dart';
import '../../widget/profile_card.dart';
import '../../widget/segment_title.dart';
import '../../widget/selengkapnya_button.dart';
import 'komentar_page.dart';

List<String> list = <String>['Urutkan Berdasarkan', 'Terbaru', 'Terlama'];

class IsiBeritaLaporanPage extends StatefulWidget {
  final String category;
  const IsiBeritaLaporanPage({super.key, required this.category});

  @override
  State<IsiBeritaLaporanPage> createState() => _IsiBeritaLaporanPageState();
}

class _IsiBeritaLaporanPageState extends State<IsiBeritaLaporanPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetComplaintCategoryViewModel>(context, listen: false).getResultCompaintCategory(category: widget.category, sort: "desc");
    });
  }

  Future<Uint8List> getVideoThumbnail(String videoUrl) async {
    final thumbnail = await VideoThumbnail.thumbnailData(
      video: videoUrl,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );
    return thumbnail!;
  }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetComplaintCategoryViewModel>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: LiquidPullToRefresh(
        backgroundColor: AppColors.secondary100,
        color: AppColors.primary,
        height: 50,
        animSpeedFactor: 5,
        showChildOpacityTransition: false,
        onRefresh: () async {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Provider.of<GetComplaintCategoryViewModel>(context, listen: false).getResultCompaintCategory(category: widget.category, sort: "desc");
            dropdownValue = list.first;
          });
        },
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                children: [
                  const SegmentTitle(title: "Laporan"),
                  const SizedBox(
                    height: 87.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          decoration: BoxDecoration(border: Border.all(width: 1, color: AppColors.primary), borderRadius: BorderRadius.circular(8)),
                          width: 184,
                          height: 32,
                          child: Center(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(color: AppColors.primary, Icons.expand_more),
                              elevation: 16,
                              style: const TextStyle(color: AppColors.font, fontSize: 14, fontWeight: FontWeight.w500),
                              // underline: Container(
                              //   height: 2,
                              //   color: AppColors.primary,
                              // ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;

                                  if (dropdownValue == 'Urutkan Berdasarkan') {
                                    setState(() {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        Provider.of<GetComplaintCategoryViewModel>(context, listen: false).getResultCompaintCategory(category: widget.category, sort: "desc");
                                      });
                                    });
                                  }
                                  if (dropdownValue == 'Terbaru') {
                                    setState(() {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        Provider.of<GetComplaintCategoryViewModel>(context, listen: false).getResultCompaintCategory(category: widget.category, sort: "desc");
                                      });
                                    });
                                  }

                                  if (dropdownValue == 'Terlama') {
                                    setState(() {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        Provider.of<GetComplaintCategoryViewModel>(context, listen: false).getResultCompaintCategory(category: widget.category, sort: "asc");
                                      });
                                    });
                                  }
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26.0,
                  ),
                  if (provider.isLoading == true) const SizedBox(height: 500, child: Center(child: CircularProgressIndicator())),
                  if (provider.isLoading == false && provider.complaintCategory.isEmpty)
                    const SizedBox(
                      height: 500,
                      child: Center(
                        child: Text(style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.primary), "Laporan Kosong"),
                      ),
                    ),
                  if (provider.isLoading == false && provider.complaintCategory.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: provider.complaintCategory.length,
                      itemBuilder: (context, index) {
                        final result = provider.complaintCategory[index];
                        return Column(
                          children: [
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
                                    ProfileCard(
                                      avatar: result.photoProfile ?? "assets/logo/PP.png",
                                      name: result.fullName,
                                      username: "@${result.username}",
                                      tanggal: result.createdAt,
                                    ),
                                    const SizedBox(height: 8),
                                    IsiLaporanItem(
                                      video: result.videoUrl,
                                      imageComplaint: result.photoUrl,
                                      laporan: result.description,
                                      tanggapan: result.feedback,
                                    ),
                                    const SizedBox(height: 8),
                                    SelengkapnyaButton(
                                        title: "Selengkapnya",
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            PageRouteBuilder(
                                                pageBuilder: (context, animation, secondaryAnimation) {
                                                  return KomentarPage(id: result.id);
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
                              )),
                            ),
                            const SizedBox(height: 13.0),
                            InteractionCard(
                              jumlahLike: "${result.likesCount} ",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KomentarPage(
                                              id: result.id,
                                            )));
                              },
                            ),
                            const SizedBox(height: 22.5),
                          ],
                        );
                      },
                    )
                  //Isi berita laporan
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
