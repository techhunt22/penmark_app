import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/utils/CustomWidgets/custom_textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import 'header.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final Widget background = SvgPicture.asset(
    "assets/images/background.svg",
    fit: BoxFit.fitHeight,
  );

  final TextEditingController newpass = TextEditingController();
  final TextEditingController repass = TextEditingController();

  @override
  void dispose() {
    newpass.dispose();
    repass.dispose();

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
                    HeaderAuth(
                      text: 'New Password',
                    ),
                    SizedBox(
                      height: gap3,
                    ),

                    CustomPasswordField(
                      controller: newpass,
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
                    ), CustomPasswordField(
                      controller: repass,
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
                      height: gap2,
                    ),



                    CustomButton(
                      onPressed: () {
                        print("=> FORGOT PASSWORD");

                        showCustomDialog(context);
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

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,

      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Center(
            child: Text(
              'Password Updated',
              style: TextStyle(
                fontSize: AppFontSize.titlemedium,
                fontWeight: AppFonts.semiBold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset("assets/icons/tickicon.png"),
              SizedBox(height: gap1),


              Center(child: Text("Your Password has been Updated!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFontSize.bodylarge, fontWeight: AppFonts.semiBold),)),
              SizedBox(height: gap1),

              CustomButton(
                onPressed: () {
                  print("=> FORGOT PASSWORD");
                  context.pop();
                },
                text: "Ok",
                color: AppColors.purple,
                borderradius: 12,
                height: 58,
                width: 150,
                fontsize: AppFontSize.titlemedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
