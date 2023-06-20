import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/get_complaint_status_provider.dart';
import '../../config/app_color.dart';
import '../../widget/custom_alert_dialog.dart';
import '../../widget/custom_dialog.dart';
import '../../widget/dashed_divider.dart';
import '../../widget/segment_title.dart';

enum Type { pending, proccess, resolve }

class EditStatusComplaint extends StatefulWidget {
  final Type status;
  const EditStatusComplaint({super.key, required this.status});

  @override
  State<EditStatusComplaint> createState() => _EditStatusComplaintState();
}

class _EditStatusComplaintState extends State<EditStatusComplaint> {
  @override
  void initState() {
    super.initState();
    if (widget.status == Type.pending) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<GetComplaintStatusViewModel>(context, listen: false).getResultCompaintStatus(status: "Pending");
      });
    }
    if (widget.status == Type.proccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<GetComplaintStatusViewModel>(context, listen: false).getResultCompaintStatus(status: "Proccess");
      });
    }
    if (widget.status == Type.resolve) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<GetComplaintStatusViewModel>(context, listen: false).getResultCompaintStatus(status: "Resolved");
      });
    }
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
            const SegmentTitle(title: "Detail Status"),
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
                  padding: const EdgeInsets.all(28),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 584),
                    width: double.infinity,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                              "Laporan Saya"),
                          Text(
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                              "Cabut"),
                        ],
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
                      if (provider.isLoading) const SizedBox(height: 500, child: Center(child: CircularProgressIndicator())),
                      if (!provider.isLoading)
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
                                    child: SizedBox(
                                  width: 185,
                                  child: Text(style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w500), maxLines: 1, textAlign: TextAlign.left, "${index + 1}. ${result.description}"),
                                )),
                                IconButton(
                                    icon: const ImageIcon(AssetImage("assets/icons/Trash.png")),
                                    onPressed: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          barrierColor: null,
                                          context: context,
                                          builder: (BuildContext context) => CustomDialog(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  showDialog(
                                                      barrierColor: null,
                                                      context: context,
                                                      builder: (BuildContext context) => const CustomAlertDialog(
                                                            title: "Laporan Terhapus",
                                                            icon: "assets/icons/Trash.png",
                                                          ));
                                                },
                                                confirm: "Ya, Hapus",
                                                icon: "assets/icons/Trash.png",
                                                title: "Kamu Yakin Untuk Mencabut Laporan?",
                                              ));
                                    })
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
