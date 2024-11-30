import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';

class OrderOverviewScreen extends StatelessWidget {
  const OrderOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    );
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
                      "Order Overview",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.headlinelarge),
                    ),
                  ),
                  const SizedBox(
                    height: gap2,
                  ),
                  orderSummarWidget(),

                  pricingWidget(),
                  totalAmountWidget()

                ],
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: CustomButton(
        onPressed: () {
          print("=> paymentmethod");

          context.push('/paymentmethod');
        },
        text: "Next",
        color: AppColors.orangesoft,
        borderradius: 12,
        height: 58,
        width: 347,
        fontsize: AppFontSize.titlesmall,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



Widget _buildDetailRow(String label, String value) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align to top for multi-line text

        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.warmgray,
                  fontSize: AppFontSize.bodylarge,
                  fontWeight: AppFonts.regular),
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.topRight, // Align content to top-right
              child: Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: AppFontSize.bodylarge,
                    fontWeight: AppFonts.regular),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Container(
        height: 1,
        color: AppColors.lightgray,
      ),
    ],
  );
}


Widget totalAmountWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(14)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Amount:",
          style: TextStyle(
            fontWeight: AppFonts.regular,
            fontSize: AppFontSize.bodylarge,
            color: AppColors.warmgray
          ),
        ),
        Text(
          "\$40.00",
          style: TextStyle(
            fontWeight: AppFonts.bold,
            fontSize: AppFontSize.bodylarge,
            color: AppColors.orangesoft
          ),
        ),
      ],
    ),
  );
}



Widget orderSummarWidget() {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          "Your Order Summary",
          style: TextStyle(
              fontSize: AppFontSize.titlesmall, fontWeight: AppFonts.regular),
        ),
        const SizedBox(height: gap),
        _buildDetailRow('Item:', ' Spring Blossom'),
        const SizedBox(height: gap),
        _buildDetailRow('size:', 'A4'),
        const SizedBox(height: gap),
        _buildDetailRow('Quantity:', '2'),
        const SizedBox(height: gap),
        _buildDetailRow('paper type:', 'Matte'),
        const SizedBox(height: gap),
      ],
    ),
  );
}



Widget pricingWidget() {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          "Pricing Breakdown",
          style: TextStyle(
              fontSize: AppFontSize.titlesmall, fontWeight: AppFonts.regular),
        ),
        const SizedBox(height: gap),
        _buildDetailRow('Subtotal:', '\$40.00'),
        const SizedBox(height: gap),
        _buildDetailRow('Tax:', '\$2.50'),
        const SizedBox(height: gap),
        _buildDetailRow('Delivery Charges:', '\$2.50'),
        const SizedBox(height: gap),

      ],
    ),
  );
}
