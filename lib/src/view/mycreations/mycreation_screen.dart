import 'package:coloring_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../widgets/appbar.dart';

class MycreationScreen extends StatefulWidget {
  const MycreationScreen({super.key});

  @override
  State<MycreationScreen> createState() => _MycreationScreenState();
}

class _MycreationScreenState extends State<MycreationScreen> {

  bool isGridview =true;

  late final Widget background;  // Use late final

  @override
  void initState() {
    super.initState();
    // Initialize in initState
    background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(child: background),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.globalpadding,
                child: Column(
                  children: [
                    AppbarWidget(),
                    SizedBox(
                      height: gap1,
                    ),
                    Text(
                      "My Creations",
                      maxLines: 1, // Limit to one line
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.headlinelarge),
                    ),
                    Text(
                      "View all your saved creations, edit or order prints.",
                      maxLines: 2, // Limit to one line
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.bodysmall2),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        viewIcons(
                          ontap: (){
                            setState(() {
                              isGridview =true;
                            });
                            print("IS GRIDVIEW");
                          },
                            img: "assets/icons/gridviewicon.png",
                            color:  isGridview  ? AppColors.purple : AppColors.white),
                        SizedBox(
                          width: 5,
                        ),
                        viewIcons(
                            ontap: (){
                              setState(() {
                                isGridview =false;
                              });
                              print("IS LISTVIEW");

                            },
                            img: "assets/icons/listviewicon.png",
                            color:isGridview  ? AppColors.white: AppColors.purple  ),
                      ],
                    ),

                    const SizedBox(height: gap1),

                    isGridview ?
                    gridviewWidget()
                        : listviewWidget(),

                    const SizedBox(height: gap1),
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

Widget viewIcons({required String img, required Color color, required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(6),
          color: color.withOpacity(0.2)),
      child: Image.asset(
        img,
      ),
    ),
  );
}

Widget iconButton({required String img, required Color color,required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: CircleAvatar(
      radius: 15,
      backgroundColor: color.withOpacity(0.2).withOpacity(0.2),
      child: Image.asset(
        img,
        color: AppColors.black,
      ),
    ),
  );
}


Widget listviewWidget() {
  return ListView.builder(
    itemCount: 6,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder:(context, index) {
      return    Container(
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
                    ontap: (){},
                      img: "assets/icons/edit.png",
                      color: AppColors.brightblue
                  ),
                  iconButton(
                      ontap: (){},
                      img: "assets/icons/print2.png",
                      color: AppColors.orangesoft
                  ),
                  iconButton(
                      ontap: (){},
                      img: "assets/icons/delete.png",
                      color: AppColors.red
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

Widget gridviewWidget() {
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
                          ontap: (){},
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
