import 'package:carousel_slider/carousel_slider.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/responsive.dart';
import 'package:coloring_app/constants/size_constant.dart';
import 'package:coloring_app/src/view/auth/components/forgot_password_screen.dart';
import 'package:coloring_app/utils/CustomWidgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/padding.dart';
import '../auth/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderheight = context.h(155);
    final iconheight = context.h(247);
    final iconwidth = context.h(201);
    final Widget background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,   alignment: Alignment.topCenter,

    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkblue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(
              child: background
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: AppPadding.globalpadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: iconheight,
                        width: iconwidth,
                        child: Image.asset(
                          "assets/icons/png/logo.png",

                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: gap1),
                      Text(
                        context.isTablet
                            ? "Color Your Imagination"
                            : "Color Your\nImagination",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontWeight: AppFonts.regular,
                            color: AppColors.white,
                            fontSize: context.sp(AppFontSize.titlemedium)),
                      ),
                      const SizedBox(height: gap1),
                      CustomButton(
                          onPressed: () {
                            print("pressed get started");
                            context.push('/auth');
                          },
                          text: "Get Started",
                          color: AppColors.orangesoft,
                          borderradius: 12,
                          height: context.h(58),
                          width: 347,
                          fontsize: AppFontSize.titlemedium),
                    ],
                  ),
                ),
                SizedBox(height: context.isTablet ? gap3 : gap1),

                CarouselSlider(
                  options: CarouselOptions(
                    height: context.isTablet ? 200 : sliderheight,
                    
                    viewportFraction: context.isTablet ? 0.2 : 0.4,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    initialPage: 0,
                    // Start from the second item to create offset effect

                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                  ),
                  items: [1, 2, 3, 4, 5, 6].map((i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        child: Image.asset("assets/images/slider$i.png",
                            fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: context.h(gap1)),

                CarouselSlider(
                  options: CarouselOptions(
                    height: context.isTablet ? 200 : sliderheight,
                    viewportFraction: context.isTablet ? 0.2 : 0.4,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    initialPage: 0,
                    // Start from the second item to create offset effect

                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                  ),
                  items: [1, 2, 3, 4, 5, 6].map((i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        child: Image.asset("assets/images/slider$i.png",
                            fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
