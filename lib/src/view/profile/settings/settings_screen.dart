import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/size_constant.dart';
import '../../widgets/alert_dialog.dart';
import '../../widgets/appbar2.dart';
import 'components/settings_list.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkblue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(child: background),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.globalpadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appbar2(
                      icon: "assets/icons/svg/settingsicon.svg",
                      text: "Settings",
                    ),
                    SizedBox(
                      height: gap2,
                    ),
                    SettingListWidget(
                        text: "Change Password",
                        img: "changepassword",
                        ontap: () {
                          context.push('/changepassword');
                        },
                        isOn: false),
                    SettingListWidget(
                        text: "Notification",
                        img: "notification",
                        ontap: () {},
                        isOn: true),
                    SettingListWidget(
                        text: "Delete Account",
                        img: "deleteaccount",
                        ontap: () {
                          showCustomDialog(context,
                              img: "assets/icons/png/dialogdltaccount.png",
                              title: "Delete Account",
                              message: "Are you sure you want to delete your account? This action is irreversible and will permanently remove all your data, including your saved creations and order history.",
                              button1: "Cancel",
                              button2: "Delete",
                              buttoncolor: AppColors.red,
                              onConfirm: () {

                              },
                              onCancel: () {
                                context.pop();
                              }
                          );
                        },
                        isOn: false),
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

