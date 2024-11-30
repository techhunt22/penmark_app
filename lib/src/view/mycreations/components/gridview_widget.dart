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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 15,
        childAspectRatio: 0.6,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Container
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  "assets/images/sketch.png",
                  height: 200, // Adjust height as needed
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                // Add padding for content
                child: Column(
                  children: [
                    Text(
                      "Flower Dream",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: AppFontSize.bodylarge,
                        fontWeight: AppFonts.regular,
                      ),
                    ),
                    const SizedBox(height: gap),
                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        iconButton(
                            ontap: (){},
                            img: "assets/icons/edit.png",
                            color: AppColors.brightblue),
                        iconButton(
                            ontap: (){
                              context.push('/printscreen');
                            },
                            img: "assets/icons/print2.png",
                            color: AppColors.orangesoft),
                        iconButton(
                            ontap: (){},
                            img: "assets/icons/delete.png", color: AppColors.red),
                      ],
                    ),
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

