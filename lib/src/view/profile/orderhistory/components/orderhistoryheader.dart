import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/color_constants.dart';

class OrderHistoryHeader extends StatelessWidget {
  const OrderHistoryHeader({super.key});

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
              backgroundColor: AppColors.white,
              child: Icon(
                Icons.arrow_back_outlined,
                color: AppColors.black,
                size: 20,
              )),
        ),
         GestureDetector(
          onTap: () {
            context.push('/notification');
          },
          child: CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.white,
              child: SvgPicture.asset(
                "assets/icons/svg/bellicon.svg",
              )),
        ),
      ],
    );
  }
}
