import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/size_constant.dart';
import '../colorpage/color_screen.dart';
import '../widgets/appbar.dart';

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
            child: Padding(
              padding: AppPadding.globalpadding,
              child: Column(
                children: [
                  AppbarWidget(),
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
                  Expanded(child: buildListView()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Listview for Templates Widget
GridView buildListView() {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 5,
      mainAxisSpacing: 10, // Vertical space between cards
      childAspectRatio: 0.8, // Aspect ratio of the car
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColoringScreen(),
                ));
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
                fit: BoxFit.fill, // Cover the entire space of the container
              ),
              Positioned(
                top: 8, // Adjust the position to fit your design
                right: 8, // Adjust the position to fit your design
                child: InkWell(
                  onTap: () {
                    // Handle the button tap
                    print("Button tapped!");
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange, // Background color of the button
                      shape: BoxShape.circle, // Circular button
                    ),
                    child: Icon(
                      Icons.edit, // Icon inside the button
                      color: Colors.white, // Icon color
                      size: 20, // Icon size
                    ),
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
