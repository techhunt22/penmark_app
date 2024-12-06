import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/responsive.dart';
import 'package:coloring_app/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool islogin = true; // Add this state variable
  final Widget background =  SvgPicture.asset(
    "assets/images/background.svg",
    fit: BoxFit.fill,  // Change from cover to fill
    alignment: Alignment.center,  // Change from topCenter to center
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox.expand(
              child: background
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(

                  children: [
                    // Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: gap1),
                        SizedBox(
                          height: context.h(142),
                          width: context.w(84),
                          child: SvgPicture.asset("assets/icons/svg/logo.svg"),
                        ),
                      ],
                    ),
                    const SizedBox(height: gap),
                    // TabBar
                    tabBar(),
                    const SizedBox(height: gap),

                    islogin
                        ? LoginScreen()
                        : SignupScreen(),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBar() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        GestureDetector(
          onTap: (){
            setState(() {
              islogin = true;
            });
          },
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: AppFontSize.titlelarge,
                fontWeight: AppFonts.semiBold,
                fontFamily: AppFonts.poppins,
                color: islogin ? AppColors.brightblue : AppColors.warmgray),
          ),
        ),
        Container(
          height: 20, // Explicit height for divider
          width: 1,
          color: AppColors.warmgray,
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              islogin = false;
            });
          },
          child: Text(
            "Signup",
            style: TextStyle(
                fontSize: AppFontSize.titlelarge,
                fontWeight: AppFonts.semiBold,
                fontFamily: AppFonts.poppins,
               color:  islogin ?AppColors.warmgray: AppColors.brightblue
            ),
          ),
        ),
      ]),
    );
  }
}
