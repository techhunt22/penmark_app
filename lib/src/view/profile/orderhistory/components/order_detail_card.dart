import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/size_constant.dart';
import 'package:flutter/material.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset("assets/images/orderimg.png")),
          _buildDetailRow('Order ID:', '#12345'),
          const SizedBox(height: gap),
          _buildDetailRow('Template:', 'Flower Power'),
          const SizedBox(height: gap),
          _buildDetailRow('Date:', '2024-09-20'),
          const SizedBox(height: gap),
          _buildDetailRow('Quantity:', ''),
          const SizedBox(height: gap),
          _buildDetailRow('Size:', 'A4'),
          const SizedBox(height: gap),
          _buildDetailRow('Paper Type:', 'Matte'),
          const SizedBox(height: gap),
          _buildDetailRow('Status:', 'In Progress'),
          const SizedBox(height: gap),
          _buildDetailRow('Price:', '\$40.00'),
          const SizedBox(height: gap),
          Text(
            "Order Timeline",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: AppFonts.regular, fontSize: AppFontSize.titlelarge),
          ),
          const SizedBox(height: gap),
          _buildDetailRow('Order Received', '2024-09-20'),
          const SizedBox(height: gap),
          _buildDetailRow('Delivered', '2024-09-21'),
          const SizedBox(height: gap),
          Text(
            "Shipping Details",
            style: TextStyle(
                fontWeight: AppFonts.regular, fontSize: AppFontSize.titlelarge),
          ),
          const SizedBox(height: gap),
          Text(
            "Address:",
            style: TextStyle(
                fontWeight: AppFonts.regular,
                color: AppColors.warmgray,
                fontSize: AppFontSize.bodylarge),
          ),
          const SizedBox(height: 10),
          Text(
            "123 Main St, City, XYZ",
            style: TextStyle(
                fontWeight: AppFonts.regular,
                color: AppColors.black,
                fontSize: AppFontSize.bodylarge),
          ),
          const SizedBox(height: gap),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: viewDetailButton(
                    clrbtn: AppColors.warmgray,
                    clrtext: AppColors.warmgray,
                    text: "Cancel Order"),
              ),
              SizedBox(width: gap), // Add spacing between buttons

              Expanded(
                child: viewDetailButton(
                    clrbtn: AppColors.orangesoft,
                    clrtext: AppColors.orangesoft,
                    text: "Contact Support"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Center viewDetailButton(
    {required Color clrbtn, required Color clrtext, required String text}) {
  return Center(
      child: Container(
    height: 32,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: const AssetImage("assets/images/buttonshape.png"),
        fit: BoxFit.fitWidth,
        colorFilter: ColorFilter.mode(
          clrbtn,
          BlendMode.srcIn,
        ),
      ),
    ),
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        text,
        textAlign: TextAlign.center, // Center align text
        maxLines: 1, // Limit to one line
        overflow: TextOverflow.ellipsis, // Handle overflow
        style: TextStyle(
            fontSize: AppFontSize.bodylarge,
            fontWeight: AppFonts.semiBold,
            color: clrtext),
      ),
    ),
  ));
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
