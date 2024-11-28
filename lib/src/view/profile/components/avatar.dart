import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
            radius: 62,
            backgroundColor: AppColors.transparent,
            child: Stack(children: [
              Image.asset("assets/images/profileimage.png"),
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: AppColors.purple,
                  child: Image.asset("assets/icons/edit.png"),
                ),
              )
            ])),
        Text(
          "Jean-Paul",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: AppFontSize.titlelarge,
              fontWeight: AppFonts.regular,
              color: AppColors.white),
        ),
      ],
    );
  }
}
