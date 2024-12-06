import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';


class Appbar2 extends StatelessWidget {
  final String text;
  final String icon;
  const Appbar2({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {

            context.pop();
          },
          child: CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.dark,
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.white,
                size: 20,
              )),
        ),
        Spacer(),
        SvgPicture.asset(
          icon,
          height: 22,
        ),
        SizedBox(
          width: gap,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: AppFontSize.titlesmall,
              fontWeight: AppFonts.regular,
              color: AppColors.white),
        )
      ],
    );
  }
}




