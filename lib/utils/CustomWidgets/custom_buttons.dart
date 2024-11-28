import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double borderradius;
  final double height;
  final double width;
  final double fontsize;
  final bool isLoading; // Add this line

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    required this.color,
    required this.borderradius,
    required this.height,
    required this.width,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            // minimumSize: Size(width, height),maximumSize:  Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderradius),
            ),
            backgroundColor: color,
          ),
          child: isLoading
              ? const CircularProgressIndicator()
              : FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: AppFonts.semiBold,
                          fontSize: fontsize)),
                )),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textcolor;
  final Color bordercolor;
  final double borderradius;
  final double height;
  final double? width;
  final double fontsize;
  final bool isLoading;

  const CustomButton2({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    required this.color,
    required this.borderradius,
    required this.height,
    this.width,
    required this.fontsize,
    required this.bordercolor,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
            // minimumSize: Size(width, height),maximumSize:  Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderradius),
            ),
            backgroundColor: color,
            side: BorderSide(
              color: bordercolor,
              width: 1,
            )),
        child: isLoading
            ? const CircularProgressIndicator()
            : FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                        color:textcolor,
                        fontWeight: AppFonts.semiBold,
                        fontSize: fontsize)),
              ),
      ),
    );
  }
}
