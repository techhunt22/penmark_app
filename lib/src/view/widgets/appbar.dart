import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final Widget logo =  SvgPicture.asset(
    //   "assets/icons/svg/logo.svg",
    //   alignment: Alignment.centerLeft,
    // );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: context.h(90),
          child: Image.asset(
            "assets/icons/png/logo2.png",
          )
        ),
        GestureDetector(
          onTap: () {
            context.push('/notification');
          },
          child: CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.white,
              child: Image.asset(
                "assets/icons/png/bellicon.png",
              )),
        ),
      ],
    );
  }
}
