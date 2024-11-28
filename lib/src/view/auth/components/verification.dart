import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import 'header.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final Widget background = SvgPicture.asset(
    "assets/images/background2.svg",
    fit: BoxFit.cover,   alignment: Alignment.topCenter,

  );

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
  final TextEditingController confirmPasswordController = TextEditingController();


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
                      text: 'Verification',
                    ),
                    SizedBox(
                      height: gap3,
                    ),

                    Text("Enter verification code", style: TextStyle(fontSize: AppFontSize.titlesmall, fontWeight: AppFonts.regular),),

                    SizedBox(
                      height: gap2,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(4, (index) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              height: 47,
                              width: 47,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(12),
                                border: Border.all(
                                  color: controllers[index].text.isNotEmpty ? AppColors.purple : AppColors.warmgray,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: controllers[index],
                                  focusNode: focusNodes[index],
                                  onChanged: (value) {
                                    setState(() {});
                                    if (value.isEmpty && index > 0) {
                                      focusNodes[index - 1].requestFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  style: TextStyle(
                                    fontWeight: AppFonts.semiBold,
                                    fontSize: AppFontSize.titlesmall,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),

                    SizedBox(height: gap3),
                    CustomButton(
                      onPressed: () {
                        print("=> FORGOT PASSWORD");

                        context.push('/newpassword');
                      },
                      text: "Send",
                      color: AppColors.purple,
                      borderradius: 12,
                      height: 58,
                      width: 347,
                      fontsize: AppFontSize.titlemedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn’t receive code ?", style: TextStyle(fontSize: AppFontSize.bodymedium, fontWeight: AppFonts.regular),),
                        TextButton(
                            onPressed: (){},
                            child: Text("Resend",
                              style: TextStyle(
                                  fontSize: AppFontSize.bodymedium,
                                  fontWeight: AppFonts.regular,color: AppColors.orangesoft
                              ),),
                        )
                      ],
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
