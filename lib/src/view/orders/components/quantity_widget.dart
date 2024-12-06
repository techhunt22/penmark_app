

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Quantity",
            style: TextStyle(
                fontWeight: AppFonts.regular,
                fontSize: AppFontSize.bodymedium),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadiusDirectional.circular(14)),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/svg/cart.svg",height: 20,
              ),
              const SizedBox(width: gap),
              Expanded(
                child: TextField(

                  controller: _controller,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: AppFontSize.bodylarge,
                      fontWeight: AppFonts.regular),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 25),

                    border: InputBorder.none,
                    hintText: 'Quantity',
                    hintStyle: TextStyle(
                        color: AppColors.warmgray,
                        fontSize: AppFontSize.bodylarge,
                        fontWeight: AppFonts.regular),
                    // Reduce the TextField's internal padding
                  ),
                  readOnly: true,
                ),
              ),
              // Replace Column with Row for arrows
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity++;
                        _controller.text = quantity.toString();
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.keyboard_arrow_up_outlined, size: 20),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                        _controller.text = quantity.toString();
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
