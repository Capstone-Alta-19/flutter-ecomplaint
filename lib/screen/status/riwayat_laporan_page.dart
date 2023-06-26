import 'package:complainz/Provider/get_complaint_status_provider.dart';
import 'package:complainz/screen/status/status_complaint_page.dart';
import 'package:complainz/widget/segment_title_without_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_color.dart';
import '../../widget/dashed_divider.dart';
import '../../widget/segment_title.dart';

class RiwayatLaporanPage extends StatefulWidget {
  const RiwayatLaporanPage({super.key});

  @override
  State<RiwayatLaporanPage> createState() => _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState extends State<RiwayatLaporanPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetComplaintStatusViewModel>(context, listen: false).getResultCompaintStatus(status: "All");
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetComplaintStatusViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SegmentTitleWithoutBack(title: "Riwayat Laporan"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 584),
                    width: double.infinity,
                    child: Column(children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                            "Laporan Saya"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const DashedDivider(
                        color: AppColors.primary,
                        strokeWidth: 2,
                        gapWidth: 8,
                      ),
                      const SizedBox(
                        height: 36.5,
                      ),
                      if (provider.isLoading == false && provider.complaintStatus.isEmpty)
                        const SizedBox(
                          height: 50,
                          child: Center(child: Text("Data Kosong")),
                        ),
                      if (provider.isLoading == true) const SizedBox(height: 500, child: Center(child: CircularProgressIndicator())),
                      if (provider.isLoading == false && provider.complaintStatus.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: provider.complaintStatus.length,
                          itemBuilder: (context, index) {
                            final result = provider.complaintStatus[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    "${index + 1}. ${result.description}",
                                  ),
                                ),
                                FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                                        minimumSize: MaterialStatePropertyAll(
                                          Size(91, 40),
                                        )),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return StatusComplaint(status: result.status);
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
                                    child: const Text(
                                      style: TextStyle(color: AppColors.secondary100),
                                      "Detail",
                                    )),
                              ],
                            );
                          },
                        )
                    ]),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class RiwayatLaporanPageFromAccount extends StatefulWidget {
  const RiwayatLaporanPageFromAccount({super.key});

  @override
  State<RiwayatLaporanPageFromAccount> createState() => _RiwayatLaporanPageFromAccountState();
}

class _RiwayatLaporanPageFromAccountState extends State<RiwayatLaporanPageFromAccount> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetComplaintStatusViewModel>(context, listen: false).getResultCompaintStatus(status: "All");
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetComplaintStatusViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SegmentTitleTwoLine(title: "Riwayat Laporan"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 584),
                    width: double.infinity,
                    child: Column(children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                            "Laporan Saya"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const DashedDivider(
                        color: AppColors.primary,
                        strokeWidth: 2,
                        gapWidth: 8,
                      ),
                      const SizedBox(
                        height: 36.5,
                      ),
                      if (provider.isLoading == true) const SizedBox(height: 500, child: Center(child: CircularProgressIndicator())),
                      if (provider.isLoading == false)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: provider.complaintStatus.length,
                          itemBuilder: (context, index) {
                            final result = provider.complaintStatus[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    "${index + 1}. ${result.description}",
                                  ),
                                ),
                                FilledButton(
                                    style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                                        minimumSize: MaterialStatePropertyAll(
                                          Size(91, 40),
                                        )),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return StatusComplaint(
                                                status: result.status,
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
                                    child: const Text(
                                      style: TextStyle(color: AppColors.secondary100),
                                      "Detail",
                                    )),
                              ],
                            );
                          },
                        )
                    ]),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
