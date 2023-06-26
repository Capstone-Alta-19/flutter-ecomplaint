import 'package:complainz/Provider/get_news_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_color.dart';
import '../../widget/custom_card.dart';
import '../../widget/segment_title.dart';

class DetailBerita extends StatefulWidget {
  final int id;
  const DetailBerita({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetNewsIdViewModel>(context, listen: false).getResultNewsId(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetNewsIdViewModel>(context);
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
                  const SizedBox(
                    height: 43.5,
                  ),
                  if (provider.isLoading) const SizedBox(height: 500, child: Center(child: CircularProgressIndicator())),
                  if (!provider.isLoading && provider.complaintId == null)
                    const SizedBox(
                      height: 50,
                      child: Center(child: Text("Berita Kosong")),
                    ),
                  if (!provider.isLoading && provider.complaintId != null)
                    Center(
                      child: Text(
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.font, fontFamily: 'Poppins'),
                        textAlign: TextAlign.center,
                        provider.complaintId!.newsName,
                      ),
                    ),
                  Center(
                    child: Text(
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.font, fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                      "${provider.complaintId!.admin} | ${provider.complaintId!.category}",
                    ),
                  ),
                  Center(
                    child: Text(
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.font, fontFamily: 'Poppins'),
                      textAlign: TextAlign.center,
                      provider.complaintId!.createdAt,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 360,
                    child: Image.network(fit: BoxFit.fill, provider.complaintId!.photoUrl),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.font, fontFamily: 'Poppins'),
                      textAlign: TextAlign.justify,
                      """${provider.complaintId!.description}
                      """,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 28),
                    child: Container(alignment: Alignment.centerLeft, child: const Text(style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.font), "Baca Juga")),
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.complaintId!.newsList.length,
                      itemBuilder: (context, index) {
                        final result = provider.complaintId!.newsList[index];
                        return DetailBeritaItem(
                            judul: result.newsName,
                            gambar: result.photoUrl,
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return DetailBerita(id: result.id);
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
                            });
                      },
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
  final String judul;
  final String gambar;

  final void Function() onPressed;
  const DetailBeritaItem({super.key, required this.onPressed, required this.judul, required this.gambar});

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
                      child: Image.network(fit: BoxFit.cover, gambar)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(alignment: Alignment.centerLeft, child: Text(style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary), maxLines: 3, judul)),
                          const SizedBox(
                            height: 13,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: InkWell(onTap: onPressed, child: const Text(style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primary), "Selengkapnya", maxLines: 3)),
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
