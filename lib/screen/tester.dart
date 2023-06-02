import 'package:flutter/material.dart';

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
                if (ditanggapi.isEmpty && foto.isEmpty && video.isEmpty) {
                  return const Text("Text Aja");
                } else if (ditanggapi.isNotEmpty && foto.isEmpty && video.isEmpty) {
                  return const Text("Text ditanggapi");
                } else if (ditanggapi.isEmpty && foto.isNotEmpty && video.isEmpty) {
                  return const Text("Text foto");
                } else if (ditanggapi.isNotEmpty && foto.isNotEmpty && video.isEmpty) {
                  return const Text("Text Foto Ditanggapi");
                } else if (ditanggapi.isEmpty && video.isNotEmpty && foto.isEmpty) {
                  return const Text("Text Video");
                } else if (ditanggapi.isNotEmpty && video.isNotEmpty && foto.isEmpty) {
                  return const Text("Text vIDEO ditanggapi");
                } else {
                  return const Text("Data kosong");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
