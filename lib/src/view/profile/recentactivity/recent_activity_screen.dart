import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/font_family.dart';
import '../../../../constants/font_size.dart';
import '../../../../constants/padding.dart';
import '../../../../constants/size_constant.dart';
import 'components/activity_list.dart';
import 'components/recentactivityheader.dart';

class RecentActivityScreen extends StatelessWidget {
  const RecentActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(fit: StackFit.expand, children: [
          SizedBox.expand(child: background),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPadding.globalpadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecentActivityHeader(),
                    const SizedBox(
                      height: gap1,
                    ),
                    Center(
                      child: Text(
                        "Recent Activity",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: AppFonts.regular,
                            fontSize: AppFontSize.headlinelarge),
                      ),
                    ),
                    const SizedBox(
                      height: gap2,
                    ),
                    ActivityListWidget(),


                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
