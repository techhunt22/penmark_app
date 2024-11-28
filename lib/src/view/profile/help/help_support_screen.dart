import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../../utils/CustomWidgets/custom_textfields.dart';
import '../../widgets/appbar2.dart';
import 'components/faq_list.dart';
import 'components/message_widget.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final Widget background = SvgPicture.asset(
    "assets/images/background2.svg",
    fit: BoxFit.cover,   alignment: Alignment.topCenter,
  );

  final TextEditingController controller = TextEditingController();

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
                      icon: "assets/icons/helpsupport.png",
                      text: "Help & Support",
                    ),
                    SizedBox(
                      height: gap2,
                    ),
                    Text(
                      "FAQs",
                      style: TextStyle(
                          fontSize: AppFontSize.titlelarge,
                          fontWeight: AppFonts.regular,
                          color: AppColors.white),
                    ),

                    SizedBox(
                      height: gap,
                    ),

                    expansionTileWidget(),




                    SizedBox(
                      height: gap ,
                    ),
                    Center(
                      child: Text(
                        "Contact Support",
                        style: TextStyle(
                            fontSize: AppFontSize.titlelarge,
                            fontWeight: AppFonts.regular,
                            color: AppColors.white),
                      ),
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
                      suffixon: false,
                      title: "Name",
                      icon: Image.asset(
                        "assets/icons/profileicon.png",
                        color: AppColors.warmgray,
                      ),

                    ),

                    SizedBox(
                      height: gap1,
                    ),

                    CustomTextField2(
                      controller: controller,
                      validator: (p0) {
                        return null;
                      },
                      hinttext: "jeanpaul@gmail.com",
                      titleon: true,
                      suffixon: false,
                      title: "Name",
                      icon: Image.asset(
                        "assets/icons/mail.png",
                        color: AppColors.warmgray,
                      ),
                    ),
                    SizedBox(
                      height: gap1,
                    ),
                    FeedbackBox(),

                   const SizedBox(
                      height: gap1,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomButton(
                        onPressed: () {


                        },
                        text: "Login",
                        color: AppColors.brightblue,
                        borderradius: 12,
                        height: 58,
                        width: 144,
                        fontsize: AppFontSize.titlemedium,
                      ),
                    ),
                    const SizedBox(
                      height: gap1,
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

Widget expansionTileWidget() {
  return ListView.builder(
    itemCount: 4,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      List title = [
        "How Do I Change My Password?",
        "How do I delete my account?",
        "How can I order prints?",
        "How can I save my creations?",
      ];
      List text = [
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",

      ];
      return CustomExpansionTile(
          title: title[index],
          content: text[index]
      );
    },
  );
}
