import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import '../../../../utils/CustomWidgets/custom_textfields.dart';
import 'components/orderhistoryheader.dart';
import 'components/ordercard_widget.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final TextEditingController controller = TextEditingController();
  final Widget background = SvgPicture.asset(
    "assets/images/background2.svg",
    fit: BoxFit.cover,
    alignment: Alignment.topCenter,
  );

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
                    OrderHistoryHeader(),
                    const SizedBox(
                      height: gap1,
                    ),
                    Center(
                      child: Text(
                        "Order History",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: AppFonts.regular,
                            fontSize: AppFontSize.headlinelarge),
                      ),
                    ),
                    const SizedBox(
                      height: gap2,
                    ),
                    SearchField(
                      controller: controller,
                      hinttext: "Search",
                      suffixicon: Icon(
                        Icons.search_sharp,
                        color: AppColors.purple,
                      ),
                    ),
                    const SizedBox(
                      height: gap2,
                    ),
                    Text(
                      "Your Orders",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.titlelarge),
                    ),
                    const SizedBox(
                      height: gap,
                    ),
                    OrderHistoryCard(),



                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
