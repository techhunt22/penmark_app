import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/size_constant.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,

      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
      return Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color:AppColors.white,

          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            _buildDetailRow('Order ID:', '#12345'),
            const SizedBox(height: gap),
            _buildDetailRow('Template:', 'Flower Power'),
            const SizedBox(height: gap),
            _buildDetailRow('Date:', '2024-09-20'),
            const SizedBox(height: gap),
            _buildDetailRow('Status:', 'In Progress'),
            const SizedBox(height: gap),
            _buildDetailRow('Price:', '\$40.00'),
            const SizedBox(height: gap),
            viewDetailButton(context),
          ],
        ),
      );
    },);
  }
  Widget viewDetailButton(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push('/orderdetail');
      },
      child: Center(
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
            "View Details",
            style: const TextStyle(
                fontSize: AppFontSize.bodylarge,
                fontWeight: AppFonts.semiBold,
                color: AppColors.orangesoft
            ),
          ),
        ),
      ),
    );
  }

}


Widget _buildDetailRow(String label, String value) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to top for multi-line text

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
                  fontWeight: AppFonts.regular
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.topRight, // Align content to top-right
              child: Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: AppFontSize.bodylarge,
                    fontWeight: AppFonts.regular
                ),
              ),),
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