import 'package:complainz/Provider/get_complaint_id_provider.dart';
import 'package:complainz/config/app_color.dart';
import 'package:complainz/widget/isi_laporan_item_komen.dart';
import 'package:complainz/widget/profile_card_komen_item.dart';
import 'package:complainz/widget/segment_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_card.dart';
import '../../widget/isi_komentar_item.dart';
import '../../widget/profile_card_komen.dart';

class KomentarPage extends StatefulWidget {
  const KomentarPage({super.key, required this.id});
  final int id;
  @override
  State<KomentarPage> createState() => _KomentarPageState();
}

class _KomentarPageState extends State<KomentarPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetComplaintIdViewModel>(context, listen: false).getResultCompaintId(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetComplaintIdViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SegmentTitle(title: "Komentar"),
                const SizedBox(height: 33),
                if (provider.isLoading == true) const SizedBox(height: 500, child: Center(child: CircularProgressIndicator())),
                if (provider.isLoading == false && provider.complaintId == null) const SizedBox(child: Text("Null")),
                if (provider.isLoading == false && provider.complaintId != null)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: CustomCard(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.5,
                                  right: 20,
                                  top: 20.5,
                                ),
                                child: ProfileCardKomen(
                                  avatar: provider.complaintId!.photoProfile ?? 'assets/images/Profile.png',
                                  name: provider.complaintId!.fullName,
                                  username: '@${provider.complaintId!.username}',
                                  tanggal: provider.complaintId!.createdAt,
                                ),
                              ),
                              const SizedBox(height: 8),
                              IsiLaporanItemKomen(
                                imageComplaint: provider.complaintId!.photoUrl,
                                laporan: provider.complaintId!.description,
                                tanggapan: provider.complaintId!.feedback,
                                video: provider.complaintId!.videoUrl,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ListView.separated(
                          itemBuilder: (context, index) {
                            final resultComment = provider.complaintId!.comments[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: CustomComentar(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16.5,
                                    right: 20,
                                    top: 20.5,
                                    bottom: 12.5,
                                  ),
                                  child: Column(
                                    children: [
                                      ProfileCardKomenitem(
                                        avatar: resultComment.photoProfile ?? 'assets/images/Profile.png',
                                        name: resultComment.fullName,
                                        username: '@ ${resultComment.username}',
                                        waktu: resultComment.createdAt,
                                      ),
                                      const SizedBox(height: 8),
                                      IsiKomentarItem(
                                        laporan: resultComment.description,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                          itemCount: provider.complaintId!.comments.length),
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height - 400),
                        child: Container(
                          decoration: BoxDecoration(color: AppColors.coment100, borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/Profile.png'),
                                ),
                                const SizedBox(width: 8.0),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Tambahkan Komentar...',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/icons/ButtonComment.png',
                                    width: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            )),
      ),
    );
  }
}
