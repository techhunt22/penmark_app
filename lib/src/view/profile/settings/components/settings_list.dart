import 'package:flutter/material.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/size_constant.dart';


class SettingListWidget extends StatefulWidget {
  final String text;
  final String img;
  final VoidCallback ontap;
  final Widget? notification;
  final bool isOn;
  const SettingListWidget({super.key, required this.text, required this.img, required this.ontap, this.notification, required this.isOn});

  @override
  State<SettingListWidget> createState() => _SettingListWidgetState();
}

class _SettingListWidgetState extends State<SettingListWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadiusDirectional.circular(6)),
        child: Row(
          children: [
            Image.asset(
              "assets/icons/png/${widget.img}.png",
              scale: 0.9,color: AppColors.white,
            ),



            SizedBox(
              width: gap,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: AppFontSize.bodymedium,
                  fontWeight: AppFonts.regular,
                  color: AppColors.white),
            ),
            Spacer(),
            widget.isOn == true ?
            SizedBox(
              height: 20,
              width: 36,
              child: Switch.adaptive(

                value: isOn,
                onChanged: (value) {
                  setState(() {
                    isOn = value;
                  });
                },
                // Track colors
                activeTrackColor: AppColors.darkblue,
                inactiveTrackColor: AppColors.darkblue,
                // Thumb colors
                thumbColor: WidgetStateProperty.resolveWith((states) {
                  return AppColors.white; // Always white thumb
                }),
                // Remove borders
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                // Optional: Make track more rounded
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                // Optional: Adjust track opacity
                trackOutlineWidth: WidgetStateProperty.all(0),
              ),
            ):
                SizedBox.shrink(),


          ],
        ),
      ),
    );
  }
}



