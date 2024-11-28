import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/size_constant.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Add padding around the leading icon
          child: CircleAvatar(
            radius: 23,
            backgroundColor: AppColors.lightgray,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                size: 19,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0), // Add padding around the first action icon
            child: CircleAvatar(
              radius: 21,
              backgroundColor: AppColors.yellowvibrant.withOpacity(0.3),
              child: Image.asset("assets/icons/printicon.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Add padding around the second action icon
            child: CircleAvatar(
              radius: 21,
              backgroundColor: AppColors.orangesoft.withOpacity(0.3),
              child: Image.asset("assets/icons/save.png"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: AppPadding.globalpadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/sketch.png"),
              ],
            )),
      ),
    );
  }
}
