import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
       AppColors.white,
       AppColors.seablue,
    ];
    Color getRandomColor() {
      final random = Random();
      return colors[random.nextInt(colors.length)];
    }




    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: TextStyle(
              fontWeight: AppFonts.semiBold,
              fontSize: AppFontSize.titlesmall),
        ),

        const SizedBox(
          height: gap1,
        ),

        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            List title = [
              "Password updated successfully.",
              "New coloring templates added!",
              "Order #12345 has been shipped.",
            ];
            List text = [
              "Your recent order has been shipped and is on its way.",
              "Your recent order has been shipped and is on its way.",
              "Your recent order has been shipped and is on its way.",
            ];
            List img = [
              "changepassword",
              "paletteicon",
              "van",
            ];
            List color = [
              AppColors.orangesoft,
              AppColors.purple,
              AppColors.green,

            ];

            return  Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: getRandomColor(),
                borderRadius: BorderRadius.circular(12),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: color[index].withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/icons/png/${img[index]}.png",color: AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: gap),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title[index],
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: AppFonts.semiBold,
                                fontSize: AppFontSize.bodymedium,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              text[index],
                              maxLines: 3,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: AppFonts.medium,
                                fontSize: AppFontSize.bodysmall2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Just Now',
                      style: TextStyle(
                        color: AppColors.warmgray,
                        fontSize: AppFontSize.bodysmall,fontWeight: AppFonts.regular
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
