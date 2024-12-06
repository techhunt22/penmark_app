import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/src/view/auth/components/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Floral Blooms Collection ',
      'Portraits of Women',
      'Hands at Work',
      'Whimsical Dolls',
      'Lorem Ipsum',
      'Lorem Ipsum',
    ];

    return GestureDetector(

      onTap: (){
        context.push('/templatesdetails');
      },
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 15,right: 5),
              width: 230, // Increase the width as desired
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadiusDirectional.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/slider${index + 1}.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: AppFontSize.bodylarge,
                        fontWeight: AppFonts.regular,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}