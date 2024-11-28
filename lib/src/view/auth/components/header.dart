import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';

class HeaderAuth extends StatelessWidget {
  final String text;
  const HeaderAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            context.pop();
          },
          child: CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.white,
              child:
              Icon(Icons.arrow_back_rounded,)
          ),
        ),


        Text(text, style: TextStyle(fontSize: AppFontSize.titlesmall, fontWeight: AppFonts.regular),),
        SizedBox(width: gap2,),
      ],
    );}
}


