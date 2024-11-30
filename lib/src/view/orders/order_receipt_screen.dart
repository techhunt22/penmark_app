import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/padding.dart';
import '../../../utils/CustomWidgets/dotted_line.dart';

class OrderReceiptScreen extends StatelessWidget {
  const OrderReceiptScreen({super.key});

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: gap4),

                        Stack(
                          clipBehavior: Clip.none,
                          children: [

                            // Main Container
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),

                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: gap),
                                  // To avoid overlapping with the icon
                                  Text(
                                    "Payment Receipt",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: AppFontSize.headlinesmall,
                                      fontWeight: AppFonts.regular,
                                    ),
                                  ),
                                  const SizedBox(height: gap),

                                  Row(
                                    children: [
                                      Flexible(
                                        child: CustomPaint(
                                          painter: DottedLinePainter(),
                                          size: const Size(double.infinity, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: gap2),
                                  _buildDetailRow('Name:', 'Jean-Paul'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Address:', '123 Main St, City, XYZ'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Payment method:', 'Mastercard'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Delivery Date:', '2024-09-24'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Order ID:', '#12345'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Created at:', '2024-09-20'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Items:', ' Spring Blossoms (Print)'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Size:', 'A4'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('paper type:', 'Matte'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Quantity:', '2'),
                                  const SizedBox(height: gap),
                                  _buildDetailRow('Total Amount:', '\$45.00'),
                                  const SizedBox(height: gap2),




                                ],
                              ),
                            ),
                            // Circular Icon
                            Positioned(
                              top: -32, // Offset above the container
                              left: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 32,
                                child: Image.asset("assets/icons/tick.png")
                              ),
                            ),

                            Positioned(
                              bottom: -32, // Offset above the container
                              left: 0,
                              right: 0,
                              child:  CircleAvatar(
                                  radius: 32,
                                  backgroundColor: AppColors.transparent,
                                  child: Image.asset("assets/icons/download.png")
                              ),
                            ),
                          ],
                        ),
                      ])),
            ),
          )
        ]));
  }
}


Widget _buildDetailRow(String label, String value) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align to top for multi-line text

        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.warmgray,
                  fontSize: AppFontSize.bodylarge,
                  fontWeight: AppFonts.regular),
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.topRight, // Align content to top-right
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: AppFontSize.bodylarge,
                    fontWeight: AppFonts.regular),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Container(
        height: 1,
        color: AppColors.lightgray,
      ),
    ],
  );
}
