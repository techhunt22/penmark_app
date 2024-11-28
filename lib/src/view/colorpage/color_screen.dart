import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';
import 'components/preview_screen.dart';

class ColoringScreen extends StatefulWidget {
  const ColoringScreen({super.key});

  @override
  State<ColoringScreen> createState() => _ColoringScreenState();
}

class _ColoringScreenState extends State<ColoringScreen> {
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.globalpadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar(context),
                SizedBox(
                  height: gap1,
                ),
                Center(child: Image.asset("assets/images/sketch.png"))
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 178,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: AppColors.lightgray,
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                padding: EdgeInsets.only(left: 10, top: 15, bottom: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) {
                  List icons = [
                    "assets/icons/brush.png",
                    "assets/icons/eraser.png",
                    "assets/icons/recentcolor.png",
                    "assets/icons/undo.png",
                    "assets/icons/redo.png",
                    "assets/icons/reset.png",
                    "assets/icons/preview.png",
                    "assets/icons/zoomout.png",
                    "assets/icons/zoomin.png",

                  ];

                  return Center(
                      child: buttonWidget(
                        img: icons[index],
                        ontap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context) => PreviewScreen(),));
                        }
                      )

                  );
                },
              ),
            ),
            Expanded(child: GestureDetector(

                  onTap: () => _showColorPicker(context),


                child: Image.asset("assets/icons/colorpicker.png"))),
          ],
        ),
      ),
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              setState(() => selectedColor = color);
            },
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }



}
void showPreview(BuildContext context, ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width * 0.9,  // 80% of screen width
          height: MediaQuery.of(context).size.height * 0.6, // 60% of screen height
          child: Image.asset("assets/images/sketch.png", fit: BoxFit.contain),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}




Row appBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CircleAvatar(
          radius: 23,
          backgroundColor: AppColors.lightgray,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                size: 19,
              ))),
      Spacer(),
      CircleAvatar(
          radius: 21,
          backgroundColor: AppColors.yellowvibrant.withOpacity(0.3),
          child: Image.asset("assets/icons/printicon.png")),
      SizedBox(
        width: 15,
      ),
      CircleAvatar(
          radius: 21,
          backgroundColor: AppColors.orangesoft.withOpacity(0.3),
          child: Image.asset("assets/icons/save.png")),
    ],
  );
}

Widget buttonWidget({required String img, required VoidCallback ontap}) {
  return Container(
    width: 46,
    height: 43,
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(8),
      color: AppColors.brightblue.withOpacity(0.2),
    ),
    child: GestureDetector(
      onTap: ontap,
      child: Center(
        child: Image.asset(
          img,
          fit: BoxFit.scaleDown,
        ),
      ),
    ),
  );
}
