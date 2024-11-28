import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // Screen size helpers
  Size get size => MediaQuery.sizeOf(this);
  double get width => size.width;
  double get height => size.height;

  // Device breakpoints
  bool get isMobile => width <= 600;
  bool get isTablet => width > 600;

  // Direct scaling from Figma (BEST APPROACH)
  double w(double width) => width * (this.width / 402);
  double h(double height) => height * (this.height / 874);

  // Improved font scaling
  double sp(double size) {
    final scale = isMobile ? (width / 402) * 0.95 // Reduced scaling for phones (closer to base size)
     : (width / 402) * 1.0; // Larger for tablets
    return size * scale;
  }


  EdgeInsets padding({
    double horizontal = 0,
    double vertical = 0,
    double all = 0,
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    if (all > 0) {
      return EdgeInsets.all(w(all));
    }
    return EdgeInsets.fromLTRB(
      left > 0 ? w(left) : w(horizontal),
      top > 0 ? h(top) : h(vertical),
      right > 0 ? w(right) : w(horizontal),
      bottom > 0 ? h(bottom) : h(vertical),
    );
  }

  // Common padding values
  EdgeInsets get paddingAllSmall => padding(all: 8);
  EdgeInsets get paddingAllMedium => padding(all: 16);
  EdgeInsets get paddingAllLarge => padding(all: 24);

  EdgeInsets get paddingHorizontalSmall => padding(horizontal: 8);
  EdgeInsets get paddingHorizontalMedium => padding(horizontal: 16);
  EdgeInsets get paddingHorizontalLarge => padding(horizontal: 24);

  EdgeInsets get paddingVerticalSmall => padding(vertical: 8);
  EdgeInsets get paddingVerticalMedium => padding(vertical: 16);
  EdgeInsets get paddingVerticalLarge => padding(vertical: 24);


}




// extension ContextExtension on BuildContext {
//   // Screen size helpers
//   Size get size => MediaQuery.sizeOf(this);
//   double get width => size.width;
//   double get height => size.height;
//
//   // Device breakpoints
//   bool get isMobile => width <= 600;
//   bool get isTablet => width > 600;
//
//   // Direct scaling from Figma (BEST APPROACH)
//   // Responsive values with tablet scaling built-in
//   double w(double size) => width * (size / 402) * (isTablet ? 1.3 : 1.0);
//   double h(double size) => height * (size / 874) * (isTablet ? 1.3: 1.0);
//
//   // Improved font scaling
//   double sp(double size) => size * (width / 402) * (isTablet ? 1.2 : 0.95);
//
//
//
//   EdgeInsets padding({
//     double horizontal = 0,
//     double vertical = 0,
//     double all = 0,
//     double left = 0,
//     double right = 0,
//     double top = 0,
//     double bottom = 0,
//   }) {
//     if (all > 0) {
//       return EdgeInsets.all(w(all));
//     }
//     return EdgeInsets.fromLTRB(
//       left > 0 ? w(left) : w(horizontal),
//       top > 0 ? h(top) : h(vertical),
//       right > 0 ? w(right) : w(horizontal),
//       bottom > 0 ? h(bottom) : h(vertical),
//     );
//   }
//
//   // Common padding values
//   EdgeInsets get paddingAllSmall => padding(all: 8);
//   EdgeInsets get paddingAllMedium => padding(all: 16);
//   EdgeInsets get paddingAllLarge => padding(all: 24);
//
//   EdgeInsets get paddingHorizontalSmall => padding(horizontal: 8);
//   EdgeInsets get paddingHorizontalMedium => padding(horizontal: 16);
//   EdgeInsets get paddingHorizontalLarge => padding(horizontal: 24);
//
//   EdgeInsets get paddingVerticalSmall => padding(vertical: 8);
//   EdgeInsets get paddingVerticalMedium => padding(vertical: 16);
//   EdgeInsets get paddingVerticalLarge => padding(vertical: 24);
//
//
// }
