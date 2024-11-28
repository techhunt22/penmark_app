import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/padding.dart';
import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/size_constant.dart';
import '../widgets/appbar.dart';
import 'components/intro_widget.dart';
import 'components/quick_access_widget.dart';
import 'components/recent_activity_widget.dart';
import 'components/slider_wiget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget background = SvgPicture.asset(
      "assets/images/background2.svg",
      fit: BoxFit.cover,   alignment: Alignment.topCenter,

    );

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widgets with padding
                  Padding(
                    padding: AppPadding.globalpadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppbarWidget(),
                        IntroWidget(),
                      ],
                    ),
                  ),
                  SliderWidget(),

                  // Rest of widgets with padding
                  Padding(
                      padding: AppPadding.globalpadding,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: gap),
                            Center(
                              child: Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage(
                                        "assets/images/buttonshape.png"),
                                    fit: BoxFit.fitWidth,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.orangesoft,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "See All",
                                  style: const TextStyle(
                                    fontSize: AppFontSize.bodylarge,
                                    fontWeight: AppFonts.semiBold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: gap1),
                            Center(child: QuickAccessWidget()),
                            const SizedBox(height: gap1),
                            Text(
                              "Recent Activity",
                              style: TextStyle(
                                  fontWeight: AppFonts.regular,
                                  fontSize: context.isTablet
                                      ? AppFontSize.displaymedium
                                      : AppFontSize.headlinelarge),
                            ),
                            Text(
                              "Here's a quick overview of your latest actions.",
                              style: TextStyle(
                                fontWeight: AppFonts.regular,
                                fontSize: context.isTablet
                                    ? AppFontSize.bodylarge
                                    : AppFontSize.bodysmall,
                              ),
                            ),
                            const SizedBox(height: gap1),
                            RecentActivityWidget(),
                            const SizedBox(height: gap1),
                          ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
