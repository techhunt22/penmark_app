import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';

class ProfileListWidget extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback ontap;
  const ProfileListWidget({super.key, required this.text, required this.img, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadiusDirectional.circular(6)),
        child: Row(
          children: [
            Image.asset(
              "assets/icons/$img.png",
              scale: 1,color: AppColors.white,
            ),
            SizedBox(
              width: gap,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular,
                  color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}



