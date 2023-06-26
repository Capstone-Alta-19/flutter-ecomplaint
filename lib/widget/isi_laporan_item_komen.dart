import 'dart:io';
import 'dart:typed_data';
import 'package:complainz/screen/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../config/app_color.dart';
import '../screen/laporan/webview.dart';

class IsiLaporanItemKomen extends StatelessWidget {
  final String laporan;
  final String? tanggapan;
  final String? imageComplaint;
  final String? video;
  const IsiLaporanItemKomen({super.key, required this.laporan, required this.tanggapan, this.imageComplaint, this.video});

  Future<String?> generateThumbnail() async {
    if (video == null) return null;

    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: video!,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 64,
      maxWidth: 64,
      quality: 100,
    );

    return thumbnailPath;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.font), "Laporan"),
                  Text(style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.font), laporan),
                  // "Dosen Matakuliah salah memasukan nilai"
                  if (imageComplaint != null || video != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Wrap(
                        spacing: 8,
                        children: [
                          if (imageComplaint != null)
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              height: 63.5,
                              width: 63.5,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Webview(
                                                  link: imageComplaint!,
                                                )));
                                  },
                                  child: Image.network(fit: BoxFit.cover, imageComplaint!)),
                            ),
                          if (video != null)
                            Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                height: 63.5,
                                width: 63.5,
                                child: FutureBuilder(
                                  future: generateThumbnail(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Webview(
                                                          link: video!,
                                                        )));
                                          },
                                          child: Image.asset(fit: BoxFit.cover, "assets/images/video-thumb.png"));
                                    } else if (snapshot.hasError) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Webview(
                                                          link: video!,
                                                        )));
                                          },
                                          child: Image.asset(fit: BoxFit.cover, "assets/images/video-thumb.png"));
                                    } else if (snapshot.data != null) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Webview(
                                                        link: video!,
                                                      )));
                                        },
                                        child: Stack(children: [
                                          Positioned(height: 63.5, width: 63.5, child: Image.file(fit: BoxFit.fill, File(snapshot.data!))),
                                          Positioned(height: 63.5, width: 63.5, child: Icon(shadows: [Shadow(color: Colors.black12)], color: Colors.white, size: 30, Icons.play_arrow_rounded)),
                                        ]),
                                      );
                                    } else {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Webview(
                                                          link: video!,
                                                        )));
                                          },
                                          child: Image.asset(fit: BoxFit.cover, "assets/images/video-thumb.png"));
                                    }
                                  },
                                )),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (tanggapan != null)
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.secondary100),
                      textAlign: TextAlign.right,
                      "Tindak Lanjut",
                    ),
                    Text(
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.secondary100),
                      maxLines: 2,
                      textAlign: TextAlign.right,
                      tanggapan!,
                      //   "Terimakasih telah menyuarakan melalui Complainz. Tim terkait sudah melakukan penyelidikan pada Dosen yang Bersangkutan"
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
