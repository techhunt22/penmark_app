import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_buttons.dart';
import 'components/dropdown_widget.dart';
import 'components/quantity_widget.dart';

class PrintOrderScreen extends StatefulWidget {
  const PrintOrderScreen({super.key});

  @override
  State<PrintOrderScreen> createState() => _PrintOrderScreenState();
}

class _PrintOrderScreenState extends State<PrintOrderScreen> {
  late final Widget background;

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

  final List<String> items = [
    'A4',
    'Letter',
    'A5',
    'A2',
    'A6',
  ];

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
                      "Order Print",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.headlinelarge),
                    ),
                  ),
                  const SizedBox(
                    height: gap2,
                  ),
                  QuantityWidget(),
                  const SizedBox(
                    height: gap,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.bodymedium),
                    ),
                  ),
                  const SizedBox(
                    height: gap,
                  ),
                  addressWidget(),
                  const SizedBox(
                    height: gap,
                  ),
                  DropdownWidget(
                    title: "Size",
                    hinttext: "Choose Size",
                    menu: items,
                  ),
                  const SizedBox(
                    height: gap,
                  ),
                  DropdownWidget(
                    title: "Paper Type",
                    hinttext: "Choose paper type",
                    menu: items,
                  ),
                  const SizedBox(
                    height: gap2,
                  ),
                  subTotalWidget(),
                  const SizedBox(
                    height: gap1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: CustomButton(
        onPressed: () {
          print("=> orderoverview");

          context.push('/orderoverview');
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

  Container addressWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(14)),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/location.png",
          ),
          const SizedBox(width: gap),
          Text(
            "Address",
            style: TextStyle(
                color: AppColors.warmgray,
                fontSize: AppFontSize.bodylarge,
                fontWeight: AppFonts.regular),
          )
        ],
      ),
    );
  }

  Container subTotalWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
          color: AppColors.brightblue.withOpacity(0.5),
          borderRadius: BorderRadiusDirectional.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sub Total",
            style: TextStyle(
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),
          ),
          Text(
            "\$40.00",
            style: TextStyle(
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),
          ),
        ],
      ),
    );
  }
}
