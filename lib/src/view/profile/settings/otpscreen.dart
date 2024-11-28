import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../widgets/appbar2.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Widget background = SvgPicture.asset(
    "assets/images/background2.svg",
    fit: BoxFit.cover,
    alignment: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [
      nameController,
      emailController,
      passwordController,
      confirmPasswordController,
    ];

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Appbar2(
                    icon: "assets/icons/verification.png",
                    text: "Verification",
                  ),
                  SizedBox(
                    height: gap4,
                  ),
                  Text(
                    "Enter verification code",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSize.titlesmall,
                        fontWeight: AppFonts.regular),
                  ),
                  SizedBox(
                    height: gap2,
                  ),

                  otpContainer(controllers),

                  SizedBox(height: gap3),

                  CustomButton(
                    onPressed: () {
                      print("=> VERIFY");
                      showotpDialog(context);
                    },
                    text: "Verify",
                    color: AppColors.purple,
                    borderradius: 12,
                    height: 58,
                    width: 347,
                    fontsize: AppFontSize.titlemedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t receive code ?",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppFontSize.bodymedium,
                            fontWeight: AppFonts.regular),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend",
                          style: TextStyle(
                              fontSize: AppFontSize.bodymedium,
                              fontWeight: AppFonts.regular,
                              color: AppColors.orangesoft),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row otpContainer(List<TextEditingController> controllers) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          height: 47,
                          width: 47,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(12),
                            border: Border.all(
                              color: controllers[index].text.isNotEmpty
                                  ? AppColors.purple
                                  : AppColors.warmgray,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: controllers[index],
                              focusNode: focusNodes[index],
                              onChanged: (value) {
                                if (!mounted) return; // Safety check

                                setState(() {});
                                if (value.isNotEmpty &&
                                    index < controllers.length - 1) {
                                  // Move to next field when text is entered
                                  focusNodes[index + 1].requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  // Move to previous field when deleting
                                  focusNodes[index - 1].requestFocus();
                                }
                                // Unfocus if it's the last field and has input
                                if (value.isNotEmpty &&
                                    index == controllers.length - 1) {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              textAlign: TextAlign.center,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              style: TextStyle(
                                fontWeight: AppFonts.semiBold,
                                fontSize: AppFontSize.titlesmall,
                                color: AppColors.white,
                              ),
                              cursorColor: AppColors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                );
  }
}

void showotpDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.darkblue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Center(
          child: Text(
            'Password\nUpdated',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
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
            Center(
                child: Text(
              "Your Password has been Updated!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppFontSize.bodylarge,
                  fontWeight: AppFonts.semiBold),
            )),
            SizedBox(height: gap1),
            CustomButton2(
              onPressed: () {
                context.pop();
              },
              text: "Close",
              color: AppColors.darkblue,
              textcolor: AppColors.white,
              borderradius: 12,
              height: 58,
              width: 150,
              fontsize: AppFontSize.titlemedium,
              bordercolor: AppColors.purple,
            ),
          ],
        ),
      );
    },
  );
}
