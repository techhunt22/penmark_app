import 'package:coloring_app/constants/padding.dart';
import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../colorpage/color_screen.dart';
import '../widgets/appbar.dart';
import '../widgets/back_button_widget.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({super.key});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  final Widget background = SvgPicture.asset(
    "assets/images/background2.svg",
    fit: BoxFit.cover,   alignment: Alignment.topCenter,

  );
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(
              child: background
          ),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.globalpadding,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       BackButtonWidget(),



                       GestureDetector(
                         onTap: () {
                           context.push('/notification');
                         },
                         child: CircleAvatar(
                             radius: 22,
                             backgroundColor: AppColors.white,
                             child: SvgPicture.asset(
                               "assets/icons/svg/bellicon.svg",
                             )),
                       ),

                     ],
                   ),

                    SizedBox(
                      height: gap1,
                    ),
                    Text(
                      "Explore\nTemplates",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.headlinelarge),
                    ),
                    SizedBox(
                      height: gap1,
                    ),
                    buildListView(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Listview for Templates Widget
GridView buildListView(BuildContext context) {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: context.isTablet? 3: 2, // Number o, // Number of columns
      crossAxisSpacing: 5,
      mainAxisSpacing: 10, // Vertical space between cards
      childAspectRatio: 0.75, // Aspect ratio of the car
    ),
    scrollDirection: Axis.vertical,
    itemCount: 4,
    itemBuilder: (context, index) {
      List text = [
        "Floral Blooms Collection",
        "Portraits of Women",
        "Hands at Work",
        "Whimsical Dolls",
        "Lorem Ipsum",
        "Lorem Ipsum",
      ];
      return GestureDetector(
        onTap: () {},
        child: GestureDetector(
          onTap: () {
           context.push('/coloring');
          },
          child: imgContainer(
            no: "${index + 1}",
            text: text[index],
          ),
        ),
      );
    },
  );
}

// Template Container Widget
Widget imgContainer({required String no, required String text}) {
  return Card(
    clipBehavior: Clip.antiAlias,
    color: AppColors.white,
    elevation: 0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // Stretch the columns to fit the card
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand, // Ensures the stack fills the space

            children: [

              Image.asset(
                "assets/images/temp$no.png",
              ),

              Positioned(
                top: 8, // Adjust the position to fit your design
                right: 8, // Adjust the position to fit your design
                child: InkWell(
                  onTap: () {
                    // Handle the button tap
                    print("Button tapped!");
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.yellowvibrant,
                    child: SvgPicture.asset("assets/icons/svg/editbrush.svg", height: 20,)
                  ),
                ),
              ),
            ],
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
              fontWeight: AppFonts.regular,
            ), // Ensure text is visible
          ),
        ),
      ],
    ),
  );
}
