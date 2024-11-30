import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../constants/font_family.dart';

class DropdownWidget extends StatefulWidget {
  final String title;
  final String hinttext;
  final List<String> menu;
  const DropdownWidget({super.key, required this.title, required this.hinttext, required this.menu});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.title,
            style: TextStyle(
                fontWeight: AppFonts.regular,
                fontSize: AppFontSize.bodymedium,


            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular,
                  fontFamily: AppFonts.poppins),
              hint: Text(
                widget.hinttext,
                style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  color: AppColors.warmgray,
                  fontWeight: AppFonts.regular, fontFamily: AppFonts.poppins
                ),
              ),
              items: widget.menu
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              color: AppColors.black,
                              fontSize: AppFontSize.bodymedium,
                              fontWeight: AppFonts.regular),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.white,
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                offset: const Offset(0, -20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.white,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
