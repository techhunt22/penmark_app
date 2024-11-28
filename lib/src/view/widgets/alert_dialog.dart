import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';
// Import your app colors, fonts, and other dependencies
// import 'package:your_app/constants/app_colors.dart';
// import 'package:your_app/constants/app_fonts.dart';
// import 'package:your_app/widgets/custom_button2.dart';

void showCustomDialog(
    BuildContext context, {
      bool showImage = true,
      bool showButton1 = true,
      bool showButton2 = true,
      required Color buttoncolor,
      required String title,
      required String img,
      required String message,
      required String button1,
      required String button2,
      required VoidCallback onConfirm,
      required VoidCallback onCancel,
    }) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: showImage
            ? Center(
          child: Image.asset(
            img,
          ),
        )
            : SizedBox.shrink(),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: AppFontSize.titlemedium,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: gap1),

            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular),
            ),
            SizedBox(height: gap2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showButton1?
                Expanded(
                  flex: 1,
                  child: CustomButton2(
                    onPressed: onCancel ,
                    text: button1 ,
                    color: AppColors.white,
                    bordercolor: AppColors.warmgray,
                    borderradius: 12,
                    height: 58,
                    textcolor: AppColors.warmgray,
                    fontsize: AppFontSize.titlesmall,
                  ),
                ):SizedBox.shrink(),
                SizedBox(width: gap1),
                showButton2?
                Expanded(
                  flex: 1,
                  child: CustomButton2(
                    onPressed: onConfirm,
                    text: button2 ,
                    color: buttoncolor,
                    bordercolor: AppColors.transparent,
                    borderradius: 12,
                    textcolor: AppColors.white,
                    height: 58,
                    fontsize: AppFontSize.titlesmall,
                  ),
                ):SizedBox.shrink(),
              ],
            ),
          ],
        ),
      );
    },
  );
}