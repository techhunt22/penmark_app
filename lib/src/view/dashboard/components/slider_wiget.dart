
// Listview for Templates Widget
import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(), // Changed to allow scrolling
        itemCount: 6,
        itemBuilder: (context, index) {
          List text = [
            "Floral Blooms Collection",
            "Portraits of Women",
            "Hands at Work",
            "Whimsical Dolls",
            "Lorem Ipsum",
            "Lorem Ipsum",
          ];
          return ImgContainer(
            no: "${index + 1}",
            text: text[index],
          );
        },
      ),
    );
  }
}

class ImgContainer extends StatelessWidget {
  final String no;
  final String text;

  const ImgContainer({
    super.key,
    required this.no,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(18)
      ),
      color: AppColors.white,
      child: SizedBox(
        width:230,  // Adjust width as needed
        height:256,  // Adjust width as needed
        child: Column(
          children: [
            Image.asset(
              "assets/images/slider$no.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: AppFontSize.bodylarge,
                  fontWeight: AppFonts.regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

