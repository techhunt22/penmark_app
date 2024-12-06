import 'dart:async';

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

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start a timer for 4 seconds
    _timer = Timer(const Duration(seconds:6), _navigateToNextScreen);
  }

  @override
  void dispose() {
    // Cancel the timer if the widget is disposed before the timer finishes
    _timer.cancel();
    super.dispose();
  }

  void _navigateToNextScreen() {
    // Check if the widget is still mounted before navigating
    if (mounted) {
      // Replace '/next-screen' with the actual route of your next screen
      context.go('/splash');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkblue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/gif/splash.gif",
            ),
          ],
        ),
      ),
    );
  }
}
