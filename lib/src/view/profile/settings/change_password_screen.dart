import 'package:coloring_app/constants/color_constants.dart';

import 'package:coloring_app/constants/padding.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../utils/CustomWidgets/custom_textfields.dart';
import '../../widgets/appbar2.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController controller = TextEditingController();
  final Widget background = SvgPicture.asset(
    "assets/images/background2.svg",
    fit: BoxFit.cover,
    alignment: Alignment.topCenter,
  );

  @override
  void dispose() {
    // Dispose controller to prevent memory leaks
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.darkblue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(child: background),
          SafeArea(
            child: Padding(
              padding: AppPadding.globalpadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Appbar2(
                    icon: "assets/icons/changepassword.png",
                    text: "Change Password",
                  ),
                  SizedBox(
                    height: gap2,
                  ),
                  CustomPasswordField2(
                    controller: controller,
                    validator: (p0) {
                      return null;
                    },
                    title: "Current Password",
                    hinttext: "************",
                    titleon: true,
                    icon: Image.asset(
                      "assets/icons/lock.png",
                    ),
                  ),
                  SizedBox(
                    height: gap1,
                  ),
                  CustomPasswordField2(
                    controller: controller,
                    validator: (p0) {
                      return null;
                    },
                    title: "New Password",
                    hinttext: "************",
                    titleon: true,
                    icon: Image.asset(
                      "assets/icons/lock.png",
                    ),
                  ),
                  SizedBox(
                    height: gap1,
                  ),
                  CustomPasswordField2(
                    controller: controller,
                    validator: (p0) {
                      return null;
                    },
                    title: "Confirm New Password",
                    hinttext: "************",
                    titleon: true,
                    icon: Image.asset(
                      "assets/icons/lock.png",
                    ),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2, // Takes 2 parts of available space
                        child: CustomButton2(
                          onPressed: () {},
                          text: "Cancel",
                          color: AppColors.darkblue,
                          bordercolor: AppColors.brightblue,
                          borderradius: 12,
                          height: 58,
                          textcolor: AppColors.white,

                          // Remove fixed width
                          fontsize: AppFontSize.titlesmall,
                        ),
                      ),
                      SizedBox(width: gap1),
                      Expanded(
                        flex: 3, // Takes 3 parts of available space
                        child: CustomButton2(
                          onPressed: () {
                            context.push('/otpscreen');
                          },
                          text: "Save Password",
                          color: AppColors.brightblue,
                          bordercolor: AppColors.transparent,
                          borderradius: 12,
                          textcolor: AppColors.white,

                          height: 58,

                          // Remove fixed width
                          fontsize: AppFontSize.titlesmall,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: gap2,
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
