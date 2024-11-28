import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import 'components/orderhistoryheader.dart';
import 'components/order_detail_card.dart';
import 'components/ordercard_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final Widget background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
            fit: StackFit.expand, children: [
          SizedBox.expand(child: background),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.globalpadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderHistoryHeader(),
                    const SizedBox(
                      height: gap1,
                    ),
                    Center(
                      child: Text(
                        "Order Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: AppFonts.regular,
                            fontSize: AppFontSize.headlinelarge),
                      ),
                    ),

                    const SizedBox(
                      height: gap2,
                    ),
                    OrderDetailCard(),


                    const SizedBox(
                      height: gap2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}




