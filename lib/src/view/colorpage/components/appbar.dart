import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';


class ColorScreenHeader extends StatelessWidget {
  const ColorScreenHeader({super.key});

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
              backgroundColor: AppColors.lightgray,
              child: Icon(
                Icons.arrow_back_outlined,
                color: AppColors.black,
                size: 20,
              )),
        ),
        Spacer(),
        CircleAvatar(
            radius: 21,
            backgroundColor: AppColors.yellowvibrant.withOpacity(0.3),
            child: Image.asset("assets/icons/png/printicon.png")),
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
            radius: 21,
            backgroundColor: AppColors.orangesoft.withOpacity(0.3),
            child: Image.asset("assets/icons/png/save.png")),
      ],
    );
  }
}
