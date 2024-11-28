import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';

class SocialButtons extends StatelessWidget {
  final String img;
  final double height;
  final double width;
  const SocialButtons({super.key, required this.img, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width: width,
      padding: EdgeInsets.all( 15),
      decoration: BoxDecoration(
        borderRadius:BorderRadiusDirectional.circular(10),
        color: AppColors.white,

      ),
      child: Center(child: SvgPicture.asset(img,fit: BoxFit.contain)),
    );
  }
}

