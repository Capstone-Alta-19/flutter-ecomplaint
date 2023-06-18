import 'package:complainz/Provider/get_complaint_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  const IsiBeritaLaporanPage({super.key});

  @override
  State<IsiBeritaLaporanPage> createState() => _IsiBeritaLaporanPageState();
}

class _IsiBeritaLaporanPageState extends State<IsiBeritaLaporanPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetComplaintCategoryViewModel>(context, listen: false).getResultCompaintCategory();
    });
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
      body: SingleChildScrollView(
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
                if (provider.isLoading == true) Center(child: CircularProgressIndicator()),
                if (provider.isLoading == false)
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
                                    username: result.username,
                                    tanggal: result.createdAt,
                                  ),
                                  const SizedBox(height: 8),
                                  IsiLaporanItem(
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
                                                return const KomentarPage();
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
                          InteractionCard(jumlahLike: "${result.likesCount} "),
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
    );
  }
}
