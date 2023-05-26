import 'package:flutter/material.dart';

class AvatarButtonStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Button Stack'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              //backgroundImage: AssetImage('assets/avatar.png'),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      // Aksi yang dijalankan ketika tombol diklik
                      print('Tombol Pesan Diklik');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      // Aksi yang dijalankan ketika tombol diklik
                      print('Tombol Panggilan Diklik');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AvatarButtonStack(),
  ));
}
