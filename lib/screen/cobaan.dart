import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavBar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavBar'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
      resizeToAvoidBottomInset:
          true, // Mengizinkan penyesuaian otomatis saat keyboard muncul
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  onTap: () {
                    _scrollToBottom(
                        context); // Memanggil fungsi untuk menggerakkan tampilan ke bagian bawah
                  },
                  decoration: InputDecoration(
                    hintText: 'Tambahkan komentar...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk mengirim komentar
                },
                child: Text('Kirim'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToBottom(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final renderObject = context.findRenderObject();
      final renderBox = renderObject as RenderBox;
      final scrollController = PrimaryScrollController.of(context);
      final targetPosition = scrollController!.position.maxScrollExtent;
      scrollController.animateTo(
        targetPosition,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
