import 'package:complainz/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatelessWidget {
  final int flex1;
  final int flex2;
  final Image assets;
  final String cardText;
  final EdgeInsetsGeometry? paddingImage;
  final EdgeInsetsGeometry? paddingText;
  final Function()? onTap;

  const Cards({
    super.key,
    required this.flex1,
    required this.flex2,
    required this.assets,
    required this.cardText,
    this.paddingImage,
    this.paddingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shadowColor: const Color.fromRGBO(0, 0, 0, 25),
        color: const Color(0XFFFCFCFC),
        child: Row(
          children: [
            Expanded(
              flex: flex1,
              child: Container(
                padding: paddingImage,
                //padding: const EdgeInsets.only(left: 10),
                child: assets,
                //fit: BoxFit.cover,
                width: 106,
                height: 99.7,
              ),
            ),
            Expanded(
              flex: flex2,
              child: Container(
                padding: paddingText,
                //padding: const EdgeInsets.only(left: 24, right: 10),
                child: Text(
                  cardText,
                  style: GoogleFonts.poppins(
                    color: AppColor.font,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/pengaduan.png',
                            fit: BoxFit.cover,
                            width: 106,
                            height: 99.7,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 24, right: 10),
                          child: Text(
                            'Pengaduan',
                            style: GoogleFonts.poppins(
                              color: AppColor.font,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ), */

class CustomCards extends StatelessWidget {
  final int flexText;
  final int flexImage;
  final Image assets;
  final Function()? onTap;

  const CustomCards({
    super.key,
    required this.flexText,
    required this.flexImage,
    required this.assets,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shadowColor: const Color.fromRGBO(0, 0, 0, 25),
        color: const Color(0XFFFCFCFC),
        child: Row(
          children: [
            Expanded(
              flex: flexText,
              child: Container(
                padding: const EdgeInsets.only(left: 48),
                child: Text(
                  'Aspirasi',
                  style: GoogleFonts.poppins(
                    color: AppColor.font,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: flexImage,
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: assets,
                //fit: BoxFit.cover,
                width: 106,
                height: 99.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/* Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                'Aspirasi',
                style: GoogleFonts.poppins(
                  color: AppColor.font,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/aspirasi.png',
                fit: BoxFit.cover,
                width: 106,
                height: 99.7,
              ),
            ),
          )
        ],
      ),
    ); */