import 'package:coloring_app/constants/responsive.dart';
import 'package:coloring_app/src/view/auth/components/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../utils/CustomWidgets/custom_textfields.dart';
import '../bottom_navigationbar.dart';
import 'components/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

// Cache SVG widgets
  final Widget mailIcon = SvgPicture.asset(
    "assets/icons/mail.svg",
    height: 15,
    width: 19,
    fit: BoxFit.scaleDown,
  );

  final Widget lockIcon = SvgPicture.asset(
    "assets/icons/lock.svg",
    height: 18,
    width: 19,
    fit: BoxFit.scaleDown,
  );

  @override
  Widget build(BuildContext context) {
    final socialHeight = context.isTablet ? context.h(65) * 0.7 : context.h(65);
    final socialWidth = context.isTablet ? context.w(89) * 0.7 : context.w(89);


    return Column(
      mainAxisSize: MainAxisSize.min, // Important

      children: [
        CustomTextField(
            controller: _controller,
            validator: (p0) {
              return null;
            },
            icon: SvgPicture.asset(
              "assets/icons/mail.svg",
              height: 15,
              width: 19,
              fit: BoxFit.scaleDown,
            ),
            hinttext: "Email or phone number",
            title: "Email/Number",
            titleon: true),
        SizedBox(
          height: gap,
        ),
        CustomPasswordField(
          controller: _controller,
          validator: (p0) {
            return null;
          },
          title: "Password",
          hinttext: "************",
          titleon: true,
          icon: SvgPicture.asset(
            "assets/icons/lock.svg",
            height: 18,
            width: 19,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          height: context.isTablet ? gap4 : gap,
        ),
        CustomButton(
          onPressed: () {
            print("=> DASHBOARD");


           context.push('/dashboard');
          },
          text: "Login",
          color: AppColors.brightblue,
          borderradius: 12,
          height: 58,
          width: 347,
          fontsize: AppFontSize.titlemedium,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              print("=> FORGOT PASSWORD");
              context.push("/forgotpassword");

            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.semiBold,
                  color: AppColors.warmgray),
            ),
          ),
        ),
        SizedBox(height: context.isTablet ? gap3 : gap1),

        Wrap(
          runSpacing: 20,
          spacing: 20,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment:  WrapCrossAlignment.center,
          children: [
            SocialButtons(
              img: "assets/icons/fb.svg",
              height: socialHeight,
              width: socialWidth,
            ),
            SocialButtons(
              img: "assets/icons/google.svg",
              height: socialHeight,
              width: socialWidth,
            ),
            SocialButtons(
              img: "assets/icons/apple.svg",
              height: socialHeight,
              width: socialWidth,
            ),
          ],
        ),
        SizedBox(
          height:  gap,
        ),
      ],
    );
  }
}
