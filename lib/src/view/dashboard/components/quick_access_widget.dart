import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';

class QuickAccessWidget extends StatelessWidget {
  const QuickAccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isTablet
          ? 598: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Quick Access",
            style: TextStyle(
              fontWeight: AppFonts.regular,
              fontSize: context.isTablet
                  ? AppFontSize.displaysmall
                  : AppFontSize.headlinesmall,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Need to find something fast?",
            style: TextStyle(
              fontWeight: AppFonts.regular,
              fontSize: context.isTablet
                  ? AppFontSize.bodylarge
                  : AppFontSize.bodysmall,
            ),
          ),
          const SizedBox(height: gap1),
          Wrap(
            spacing: 10,
            runSpacing: 20,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(4, (index) {
              List clr = [
                AppColors.brightblue,
                AppColors.purple,
                AppColors.yellowvibrant,
                AppColors.orangesoft,
              ];
              List text = [
                "My Templates",
                "Print Creation",
                "Templates",
                "Order history",
              ];
              List icon = [
                "assets/icons/svg/mytemplates.svg",
                "assets/icons/svg/printquickaccess.svg",
                "assets/icons/svg/orderhistory.svg",
                "assets/icons/svg/templates.svg",
              ];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:context.isTablet
                        ? 82: 64,
                    width:context.isTablet
                        ? 100: 78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: clr[index].withOpacity(0.5),
                    ),
                    child: SvgPicture.asset(icon[index],height: 48, fit: BoxFit.scaleDown),
                  ),
                  SizedBox(height: 8),
                  Text(
                    text[index],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: AppFonts.regular,
                      fontSize: context.isTablet
                          ? AppFontSize.bodylarge
                          : AppFontSize.bodysmall,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
