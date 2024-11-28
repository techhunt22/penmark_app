import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/padding.dart';
import 'package:coloring_app/src/view/auth/components/forgot_password_screen.dart';
import 'package:coloring_app/src/view/profile/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/size_constant.dart';
import '../widgets/alert_dialog.dart';
import 'components/avatar.dart';
import 'components/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.globalpadding,
                child: Column(
                  children: [
                    Avatar(),
                    SizedBox(
                      height: gap3,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/settingicon.png",
                          color: AppColors.white,
                        ),
                        SizedBox(
                          width: gap,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: AppFontSize.titlelarge,
                              fontWeight: AppFonts.regular,
                              color: AppColors.white),
                        )
                      ],
                    ),

                    SizedBox(
                      height: gap1,
                    ),
                    Column(
                      children: List.generate(
                        6,
                        (index) {
                          List pages = [
                            '/editprofile',
                            '/orderhistory',
                            '/recentactivity',
                            '/settings',
                            '/help',
                            '/editprofile',
                          ];
                          List text = [
                            "Edit Profile",
                            "Order history",
                            "Recent Activity",
                            "Settings",
                            "Help",
                            "Log Out",
                          ];
                          List img = [
                            "edit",
                            "orderhistory",
                            "recenthistory",
                            "settingicon",
                            "help",
                            "logout",
                          ];

                          return ProfileListWidget(
                            text: text[index],
                            img: img[index],
                            ontap: () {

                              if(index < 5)
                              {context.push(pages[index]);}
                              else{
                                showCustomDialog(context,
                                    img: "assets/icons/logoutdialog.png",
                                    buttoncolor: AppColors.orangesoft,
                                    title: "Log Out",
                                    message: "Are you sure you want to log out?",
                                    button1: "No",
                                    button2: "Yes",
                                    onConfirm: () {

                                    },
                                    onCancel: () {
                                      context.pop();
                                    }, );


                              }

                            },
                          );
                        },
                      ),
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
