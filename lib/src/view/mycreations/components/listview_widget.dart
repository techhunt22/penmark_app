import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../mycreation_screen.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder:(context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(  // Replace ListTile with Row for better control
              children: [
                // Leading image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/sketch.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                // Title
                Expanded(
                  child: Text(
                    "Flower Dream",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: AppFontSize.bodylarge,
                      fontWeight: AppFonts.regular,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                // Trailing buttons
                SizedBox(
                  width: 100,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.end,
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
                ),
              ],
            ),
          );
        },
      );
    }

  }

