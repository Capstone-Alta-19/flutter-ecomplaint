import 'dart:typed_data';

import 'package:complainz/Provider/get_complaint_id_provider.dart';
import 'package:complainz/widget/isi_laporan_item_komen.dart';
import 'package:complainz/widget/profile_card_komen_item.dart';
import 'package:complainz/widget/segment_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
      Provider.of<GetComplaintIdViewModel>(context, listen: false)
          .getResultCompaintId(id: widget.id);
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SegmentTitle(title: "Komentar"),
              SizedBox(height: 33),
              if (provider.isLoading == true)
                SizedBox(
                    height: 500,
                    child: Center(child: CircularProgressIndicator())),
              // if (provider.isLoading == false && p)
              //   Container(
              //     height: 500,
              //     child: Center(
              //       child: Text(style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.primary), "Laporan Kosong"),
              //     ),
              //   ),
              if (provider.isLoading == false)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: CustomCard(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16.5,
                                right: 20,
                                top: 20.5,
                              ),
                              child: ProfileCardKomen(
                                avatar: provider.complaintId!.photoProfile ??
                                    'assets/images/Profile.png',
                                name: provider.complaintId!.fullName,
                                username: '@${provider.complaintId!.username}',
                                tanggal: provider.complaintId!.createdAt,
                              ),
                            ),
                            SizedBox(height: 8),
                            IsiLaporanItemKomen(
                              imageComplaint: provider.complaintId!.photoUrl,
                              laporan: provider.complaintId!.description,
                              tanggapan: provider.complaintId!.feedback,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ListView.separated(
                        itemBuilder: (context, index) {
                          final resultComment =
                              provider.complaintId!.comments[index];
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
                                      avatar: resultComment.photoProfile ??
                                          'assets/images/Profile.png',
                                      name: resultComment.fullName,
                                      username: '@ ${resultComment.username}',
                                      waktu: resultComment.createdAt,
                                    ),
                                    SizedBox(height: 8),
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
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: provider.complaintId!.comments.length),
                    const SizedBox(height: 30),
                  ],
                ),
              //Divider(height: 1),
              Padding(
                padding: EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Profile.png'),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Write a comment...',
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
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
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: const ImageIcon(
                        AssetImage('assets/icons/ButtonComment.png')),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}