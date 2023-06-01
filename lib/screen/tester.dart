import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/colors.dart';

class Tester extends StatefulWidget {
  const Tester({super.key});

  @override
  State<Tester> createState() => _TesterState();
}

class _TesterState extends State<Tester> {
  bool isDitanggapi = true;
  List ditanggapi = [];
  String foto = "";
  String video = "";

  @override
  void initState() {
    isDitanggapi = true;
    super.initState();
  }

  // void checkFormStatus() {
  //   setState(() {
  //     isDitanggapi = ditanggapi.isNotEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              FilledButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Ubah state")),
              Builder(builder: (_) {
                if (ditanggapi.isNotEmpty) {
                  return Text("Text Aja");
                } else if (ditanggapi.isEmpty) {
                  return Text("Text ditanggapi");
                } else if (ditanggapi.isEmpty) {
                  return Text("Text foto");
                } else if (ditanggapi.isEmpty) {
                  return Text("Text Foto Ditanggapi");
                } else if (ditanggapi.isEmpty) {
                  return Text("Text Video");
                } else if (ditanggapi.isEmpty) {
                  return Text("Text vIDEO ditanggapi");
                } else {
                  return Text("Data kosong");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
