import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../mycreation_screen.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isTablet ? 3 : 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 15,
        childAspectRatio: 0.7,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        List text = [
          "Floral Blooms Collection",
          "Portraits of Women",
          "Hands at Work",
          "Whimsical Dolls",
          "Lorem Ipsum",

        ];
        return imgContainer(
          no: "${index + 1}",
          text: text[index],
          context: context
        );
      },
    );
  }
}

Widget imgContainer({required String no, required String text, required BuildContext context}) {
  return Card(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    color: AppColors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(15)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // Stretch the columns to fit the card

      children: [
        Expanded(
          child: Image.asset(
            "assets/images/temp$no.png",
            fit: BoxFit.fill, // Cover the entire space of the container
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: AppFontSize.bodysmall2,
                fontWeight: AppFonts.regular), // Ensure text is visible
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconButton(
                ontap: (){
                  context.push('/coloring');
                },
                img: "assets/icons/svg/editicon.svg",
                color: AppColors.brightblue),
            iconButton(
                ontap: (){
                  context.push('/printscreen');
                },
                img: "assets/icons/svg/printicon.svg",
                color: AppColors.orangesoft),
            iconButton(
                ontap: (){},
                img: "assets/icons/svg/deleteicon.svg", color: AppColors.red),
          ],
        ),

        SizedBox(height: 10,),
      ],
    ),
  );
}
