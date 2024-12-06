import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';
import '../../../utils/CustomWidgets/custom_textfields.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({super.key});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  String? selectedPayment;

  late final Widget background; // Use late final
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize in initState
    background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: [
        SizedBox.expand(child: background),
        SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.globalpadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: CircleAvatar(
                        radius: 23,
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: AppColors.black,
                          size: 20,
                        )),
                  ),
                  const SizedBox(
                    height: gap1,
                  ),
                  Center(
                    child: Text(
                      "Payment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.headlinelarge),
                    ),
                  ),
                  const SizedBox(
                    height: gap2,
                  ),
                  Text(
                    "Method of payment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: AppFonts.regular,
                        fontSize: AppFontSize.titlesmall),
                  ),
                  const SizedBox(
                    height: gap,
                  ),
                  cardContainer(),

                  const SizedBox(
                    height: gap2,
                  ),
                  CustomTextField(
                      controller: _controller,
                      validator: (p0) {
                        return null;
                      },

                      hinttext: "0000 0000 0000 0000",
                      title: "Card Number",
                      titleon: true
                  ),
                  const SizedBox(
                    height: gap,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                            controller: _controller,
                            validator: (p0) {
                              return null;
                            },

                            hinttext: "MM/YY",
                            title: "Expiry date",
                            titleon: true
                        ),
                      ),
                      const SizedBox(width: gap,),
                      Expanded(
                        child: CustomTextField(
                            controller: _controller,
                            validator: (p0) {
                              return null;
                            },

                            hinttext: "000",
                            title: "CVC",
                            titleon: true
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: gap,
                  ),

                  CustomTextField(
                      controller: _controller,
                      validator: (p0) {
                        return null;
                      },

                      hinttext: "Full Name",
                      title: "Card Holder",
                      titleon: true
                  ),
                  const SizedBox(
                    height: gap3,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        print("=> ");

                        context.push('/receipt');
                      },
                      text: "Confirm Payment",
                      color: AppColors.orangesoft,
                      borderradius: 12,
                      height: 58,
                      width: 347,
                      fontsize: AppFontSize.titlesmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),

      // floatingActionButton:
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }


}


Container cardContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadiusDirectional.circular(14)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit or Debit card",
              style: TextStyle(
                  fontWeight: AppFonts.medium,
                  fontSize: AppFontSize.bodymedium,
                  color: AppColors.white
              ),
            ), Text(
              "Online payment",
              style: TextStyle(
                  fontWeight: AppFonts.regular,
                  fontSize: AppFontSize.bodysmall2,color: AppColors.white
              ),
            ),
          ],
        ),
        Image.asset("assets/icons/png/mastercard.png")
      ],
    ),
  );
}








