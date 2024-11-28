import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/src/view/splash/splash_screen.dart';
import 'package:coloring_app/utils/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants/color_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    const MyApp());
    //   DevicePreview(
    //     enabled: !kReleaseMode,
    //     builder: (context) => MyApp(), // Wrap your app
    //   ),);


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: AppFonts.poppins,
        cardColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );
  }
}
