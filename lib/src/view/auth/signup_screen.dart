import 'package:coloring_app/constants/responsive.dart';
import 'package:coloring_app/src/view/auth/components/social_buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../utils/CustomWidgets/custom_textfields.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _controller = TextEditingController();

  // Cache SVG widgets
  final Widget personIcon = SvgPicture.asset(
    "assets/icons/svg/person.svg",
    height: 15,
    width: 19,
    fit: BoxFit.scaleDown,
  );
  final Widget mailIcon = SvgPicture.asset(
    "assets/icons/svg/mail.svg",
    height: 15,
    width: 19,
    fit: BoxFit.scaleDown,
  );

  final Widget lockIcon = SvgPicture.asset(
    "assets/icons/svg/lock.svg",
    height: 15,
    width: 19,
    fit: BoxFit.scaleDown,

  );


  @override
  Widget build(BuildContext context) {
    final socialHeight = context.isTablet?  context.h(65) *0.7 :context.h(65);
    final socialWidth =context.isTablet?  context.w(89) *0.7 : context.w(89);

    return Column(
      mainAxisSize: MainAxisSize.min, // Important

      children: [
        CustomTextField(
            controller: _controller,
            validator: (p0) {
              return null;
            },
            icon:personIcon,
            hinttext: "Your name",
            title: "Full Name",
            titleon: true),
        const SizedBox(
          height: gap,
        ),
        CustomTextField(
            controller: _controller,
            validator: (p0) {
              return null;
            },
            icon: mailIcon,
            hinttext: "Email or phone number",
            title: "Email/Number",
            titleon: true),
        const SizedBox(
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
          icon: lockIcon,
        ),
         SizedBox(
          height: context.isTablet ? gap4 : gap,
        ),
        CustomButton(
            onPressed: () {
              if (kDebugMode) {
                print("pressed get submitted");
              }
            },
            text: "Signup",
            color: AppColors.brightblue,
            borderradius: 12,
            height:  58 ,
            width:347,
            fontsize: AppFontSize.titlelarge),


        SizedBox(height: context.isTablet ? gap3 : gap1),


        Wrap(
          runSpacing: 20,
          spacing: 20,
          runAlignment: WrapAlignment.center,
          children: [
            SocialButtons(
              img: "assets/icons/svg/fbicon.svg",
              height: socialHeight,
              width: socialWidth,
            ),
            SocialButtons(
              img: "assets/icons/svg/googleicon.svg",
              height: socialHeight,
              width: socialWidth,
            ),
            SocialButtons(
              img: "assets/icons/svg/appleicon.svg",
              height: socialHeight,
              width: socialWidth,
            ),
          ],
        ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //
        //   ],
        // ),
        SizedBox(
          height:  gap,
        ),
      ],
    );
  }
}
