import 'package:coloring_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/padding.dart';
import '../../../constants/size_constant.dart';
import '../widgets/appbar.dart';
import 'components/gridview_widget.dart';
import 'components/listview_widget.dart';

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
                            img: "assets/icons/svg/gridviewicon.svg",
                            color:  isGridview  ? AppColors.purple.withOpacity(0.2) : AppColors.white),
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
                            img: "assets/icons/svg/listviewicon.svg",
                            color:isGridview  ? AppColors.white: AppColors.purple.withOpacity(0.2)  ),
                      ],
                    ),

                    const SizedBox(height: gap1),

                    isGridview ?
                    GridViewWidget()
                        : ListviewWidget(),

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
          color: color),
      child: SvgPicture.asset(
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
      backgroundColor: color.withOpacity(0.2),
      child: SvgPicture.asset(
        img,
        height: 15,
      ),
    ),
  );
}




