import 'package:coloring_app/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/font_family.dart';
import '../../../constants/font_size.dart';
import '../../../constants/size_constant.dart';
import '../../../utils/CustomWidgets/custom_textfields.dart';
import '../widgets/appbar.dart';
import 'collection_detail_screen.dart';


class TemplateCollectionScreen extends StatefulWidget {
  const TemplateCollectionScreen({super.key});

  @override
  State<TemplateCollectionScreen> createState() =>
      _TemplateCollectionScreenState();
}

class _TemplateCollectionScreenState extends State<TemplateCollectionScreen> {
  final TextEditingController _controller = TextEditingController();

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
                    AppbarWidget(),
                    SizedBox(
                      height: gap1,
                    ),
                    Text(
                      "Fantasy World\nCollection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: AppFonts.regular,
                          fontSize: AppFontSize.headlinelarge),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SearchField(
                            controller: _controller,
                            hinttext: "Search",
                            suffixicon: Icon(
                              Icons.search_sharp,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                        SizedBox(width: gap,),
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.white,
                            child: Image.asset(
                              "assets/icons/filter.png",
                            )),

                      ],
                    ),



                    buildListView(),
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
// Row collectionAppbar() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Image.asset(
//         "assets/icons/profile.png",
//       ),
//       SizedBox(
//         width: 15,
//       ),
//       CircleAvatar(
//           backgroundColor: AppColors.white,
//           child: Image.asset(
//             "assets/icons/bell.png",
//           )),
//     ],
//   );
// }

// Listview for Templates Widget
GridView buildListView() {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.only(top:15, bottom: 60),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 5,
      mainAxisSpacing: 10, // Vertical space between cards
      childAspectRatio: 0.8, // Aspect ratio of the car
    ),
    scrollDirection: Axis.vertical,
    itemCount: 6,

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
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>CollectionDetailScreen()));
        },

        child: imgContainer(
          no: "${index + 1}",
          text: text[index],
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
          child: Image.asset(
            "assets/images/slider$no.png",
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
          ),),

      ],
    ),
  );
}
