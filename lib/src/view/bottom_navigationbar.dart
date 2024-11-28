import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/responsive.dart';
import 'package:coloring_app/src/view/profile/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'collection/collection_detail_screen.dart';
import 'collection/collection_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'mycreations/mycreation_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {

  final List<Widget> _pages = [
    const DashboardScreen(),
    const TemplateCollectionScreen(),
    const MycreationScreen(),
    const ProfileScreen(),


  ];

  int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      extendBody: true, // Add this
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        height: context.isTablet ? 75 : 60,
        color: _currentIndex == 3 ? AppColors.darkpurple:AppColors.darkblue,
        buttonBackgroundColor: _currentIndex == 3 ? AppColors.darkpurple: AppColors.darkblue,

        items: [
          Image.asset("assets/icons/homebottombar.png",
              color: AppColors.white,
            height: 46,

          ),
          Image.asset("assets/icons/collectionbottombar.png",
              color: AppColors.white,
            height: 46,
          ),
          Image.asset("assets/icons/palettebottombar.png",
              color:
                   AppColors.white,
            height: 46,
          ),
          Image.asset("assets/icons/personbottom.png",
              color: AppColors.white,
            height: 46,

          ),
        ],

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),


      body: _pages[_currentIndex], // Display the current page
    );
  }
}

class Check extends StatelessWidget {
  const Check({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      body: Container(),
    );
  }
}

