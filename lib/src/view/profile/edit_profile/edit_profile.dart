import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/padding.dart';
import 'package:coloring_app/utils/CustomWidgets/custom_buttons.dart';
import 'package:coloring_app/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/size_constant.dart';
import '../../widgets/appbar2.dart';
import '../components/avatar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // Dispose controller to prevent memory leaks
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Widget background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,   alignment: Alignment.topCenter,

    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appbar2(
                      icon: "assets/icons/editprofile.png",
                      text: "Edit Profile",
                    ),


                    SizedBox(
                      height: gap2,
                    ),
                    Center(child: Avatar()),
                    SizedBox(
                      height: gap1,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                          fontSize: AppFontSize.titlelarge,
                          fontWeight: AppFonts.regular,
                          color: AppColors.white),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    CustomTextField2(
                      controller: controller,
                      validator: (p0) {
                        return null;
                      },
                      hinttext: "Jean Paul",
                      titleon: true,
                      suffixon: true,
                      title: "Full Name",
                      icon: Image.asset(
                        "assets/icons/profileicon.png",
                        color: AppColors.warmgray,
                      ),
                      suffixicon: Image.asset("assets/icons/edit.png"),
                    ),
                    SizedBox(
                      height: gap1,
                    ),
                    CustomTextField2(
                      controller: controller,
                      validator: (p0) {
                        return null;
                      },
                      hinttext: "Jean Paul",
                      titleon: true,
                      suffixon: true,
                      title: "Email",
                      icon: Image.asset(
                        "assets/icons/mail.png",
                        color: AppColors.warmgray,
                      ),
                      suffixicon: Image.asset("assets/icons/edit.png"),
                    ),
                    SizedBox(
                      height: gap1,
                    ),
                    CustomTextField2(
                      controller: controller,
                      validator: (p0) {
                        return null;
                      },
                      hinttext: "Jean Paul",
                      titleon: true,
                      suffixon: true,
                      title: "Number",
                      icon: Image.asset(
                        "assets/icons/phone.png",
                        color: AppColors.warmgray,
                      ),
                      suffixicon: Image.asset("assets/icons/edit.png"),
                    ),
                    SizedBox(
                      height: gap2  ,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton2(
                          onPressed: () {},
                          text: "Cancel",
                          color: AppColors.darkblue,
                          bordercolor: AppColors.brightblue,
                          borderradius: 12,
                          height: 58,
                          width: 144,
                          fontsize: AppFontSize.titlesmall,
                          textcolor: AppColors.white,
                        ),
                        SizedBox(
                          width: gap1,
                        ),
                        CustomButton2(
                          onPressed: () {},
                          text: "Save",
                          color: AppColors.brightblue,
                          bordercolor: AppColors.transparent,
                          borderradius: 12,
                          height: 58,                          textcolor: AppColors.white,

                          width: 144,
                          fontsize: AppFontSize.titlesmall,
                        )
                      ],
                    )
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
