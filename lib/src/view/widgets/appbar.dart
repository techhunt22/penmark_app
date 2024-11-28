import 'package:coloring_app/constants/responsive.dart';
import 'package:coloring_app/src/view/auth/components/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 77,
            child: Image.asset("assets/icons/appbaricon.png")),

        Spacer(),
        Image.asset(
          "assets/icons/profile.png",
          height: 53,
        ),
        SizedBox(
          width: 15,
        ),

        GestureDetector(
          onTap: (){
            context.push('/notification');
          },
          child: CircleAvatar(
            radius: 22,
              backgroundColor: AppColors.white,
              child: Image.asset(
                "assets/icons/bell.png",
              )),
        ),

      ],
    );
  }
}
