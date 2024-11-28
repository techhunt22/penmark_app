import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/padding.dart';
import 'package:coloring_app/src/view/auth/login_screen.dart';
import 'package:coloring_app/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import 'header.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final Widget background = SvgPicture.asset(
    "assets/images/background.svg",
    fit: BoxFit.cover,   alignment: Alignment.topCenter,

  );
  final TextEditingController _controller = TextEditingController();


  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(
              child: background
          ),

         SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.globalpadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeaderAuth(text: 'Forgot Password',),
                    SizedBox(height: gap5,),

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
                    SizedBox(height: gap3),
                    CustomButton(
                      onPressed: () {
                        print("=> FORGOT PASSWORD");


                        context.push('/verification');
                      },
                      text: "Send",
                      color: AppColors.purple,
                      borderradius: 12,
                      height: 58,
                      width: 347,
                      fontsize: AppFontSize.titlemedium,
                    ),




                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
