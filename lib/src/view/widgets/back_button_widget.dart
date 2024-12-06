import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
