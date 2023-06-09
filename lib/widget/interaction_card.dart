import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../config/app_color.dart';

class InteractionCard extends StatelessWidget {
  final jumlahLike;
  final void Function() onPressed;
  const InteractionCard({super.key, this.jumlahLike, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 32, right: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  child: Row(
                    children: [
                      LikeButton(
                        size: 23,
                        circleColor: const CircleColor(start: Colors.redAccent, end: Colors.redAccent),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Colors.redAccent,
                          dotSecondaryColor: Colors.redAccent,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            isLiked ? Icons.favorite : Icons.favorite_outline,
                            color: isLiked ? Colors.redAccent : Colors.black,
                            size: 24,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0, right: 9.0),
                        child: InkWell(
                          onTap: onPressed,
                          child: const ImageIcon(size: 24, AssetImage("assets/icons/Chat-alt.png")),
                        ),
                      ),
                      InkWell(
                        child: const ImageIcon(size: 24, AssetImage("assets/icons/Out.png")),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                LikeButton(
                  size: 24,
                  circleColor: const CircleColor(start: AppColors.primary, end: AppColors.primary),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: AppColors.primary,
                    dotSecondaryColor: AppColors.primary,
                  ),
                  likeBuilder: (bool isBookmark) {
                    return ImageIcon(
                      size: 24,
                      AssetImage(isBookmark ? "assets/icons/Pin.png" : "assets/icons/Pin.png"),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(children: [
                TextSpan(style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.font), text: jumlahLike),
                const TextSpan(style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.font), text: "Likes"),
              ]),
            )
          ],
        ));
  }
}
