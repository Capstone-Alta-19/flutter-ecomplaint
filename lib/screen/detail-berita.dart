import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/color.dart';

class DetailBerita extends StatelessWidget {
const DetailBerita({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          Center(
             child: Text(
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.font, fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
                "Pemasangan AC Baru Gedung G",
              ),
            ),
          
          Center(
             child: Text(
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.font, fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
                "Admin 1 | Sarana & Prasarana",
              ),
            ),
          
          Center(
             child: Text(
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.font, fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
                "Sabtu 20 Juni 2023",
              ),
            ),
          
          SizedBox(
              height: 30,
            ),
          
          Center(
              child: Image.asset('assets/logo/gambar-ac.jpg'),
            ),
          
          Container(
              margin: EdgeInsets.all(20),
              child: Text(
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.font, fontFamily: 'Poppins'),
                textAlign: TextAlign.right,
                "Kondisi gedung G saat telah dipasang AC",
              ),
            ),
          
          Container(
              margin: EdgeInsets.all(20),
              child: Text(
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.font, fontFamily: 'Poppins'),
                textAlign: TextAlign.justify,
                """Rorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.
                \nCurabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.
                """,
              ),
            )
        ],
      )
    );
  }
}