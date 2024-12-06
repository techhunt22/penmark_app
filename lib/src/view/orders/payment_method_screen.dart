import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? selectedPayment;

  late final Widget background;  // Use late final

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
                      "Choose Payment Method",
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
                    "Available Options",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: AppFonts.regular,
                        fontSize: AppFontSize.titlemedium),
                  ),

                  const SizedBox(
                    height: gap1,
                  ),
                  buildPaymentOption(
                    img: "assets/icons/png/card.png",
                    text: 'Card',
                    value: 'card',
                  ),
                  buildPaymentOption(
                    img: "assets/icons/png/paypal.png",
                    text: 'Paypal',
                    value: 'paypal',
                  ),
                  buildPaymentOption(
                    img: "assets/icons/png/cash.png",
                    text: 'Cash on Delivery',
                    value: 'cash',
                  ),
                  const SizedBox(
                    height: gap4,
                  ),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        print("=> cardpayment");

                        context.push('/cardpayment');
                      },
                      text: "Select Payment",
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


  Widget buildPaymentOption({
    required String img,
    required String text,
    required String value,
  }) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: 5),
      padding: EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(15)
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(img),
        title: Text(text, style: TextStyle(
          fontWeight: AppFonts.regular, fontSize: AppFontSize.bodylarge
        ),),
        trailing: Radio.adaptive(
          value: value,
          activeColor: AppColors.orangesoft,
          hoverColor: AppColors.transparent,
          splashRadius: 0,

          groupValue: selectedPayment,
          onChanged: (String? newValue) {
            setState(() {
              selectedPayment = newValue;
            });
          },
        ),
      ),
    );
  }


}








