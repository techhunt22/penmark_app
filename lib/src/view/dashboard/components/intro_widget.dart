import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: gap1,
        ),
        Text(
          context.isTablet ? "Pick Your Next Masterpiece" : "Pick Your\nNext Masterpiece",

          style: TextStyle(
              height: 1.2,
              fontWeight: AppFonts.regular, fontSize:  context.isTablet ? AppFontSize.displaymedium :AppFontSize.headlinelarge),
        ),
        Text(
          "Explore our curated collection of exclusive coloring\ntemplates designed just for you!",
          style: TextStyle(
              fontWeight: AppFonts.regular, fontSize: context.isTablet ? AppFontSize.titlesmall :AppFontSize.bodysmall),
        ),
        SizedBox(
          height: gap1,
        ),
      ],
    );
  }
}


