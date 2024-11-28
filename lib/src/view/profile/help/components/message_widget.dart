import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../constants/color_constants.dart';
import '../../../../../constants/font_family.dart';
import '../../../../../constants/font_size.dart';


class FeedbackBox extends StatefulWidget {
  const FeedbackBox({super.key});

  @override
  State<FeedbackBox> createState() => _FeedbackBoxState();
}

class _FeedbackBoxState extends State<FeedbackBox> {
  final TextEditingController _controller = TextEditingController();
  final int maxLength = 200;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Message",
            style: const TextStyle(
              fontSize: AppFontSize.bodymedium,
              fontWeight: AppFonts.regular,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: TextField(
            controller: _controller,
            maxLength: maxLength,
            maxLines: 6,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            // or null for unlimited lines
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,

            style: TextStyle(
              color: AppColors.white,
              fontSize: AppFontSize.bodymedium,
              fontWeight: AppFonts.regular,
            ),
            decoration: InputDecoration(

              hintText: 'Describe your issue...',
              filled: true,
              hoverColor: AppColors.white,
              fillColor: AppColors.dark,
              hintStyle: TextStyle(
                color: AppColors.warmgray,
                fontSize: AppFontSize.bodymedium,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    const BorderSide(color: AppColors.transparent, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    const BorderSide(color: AppColors.transparent, width: 1),
              ),
            ),

            onChanged: (text) {
              setState(() {}); // Update character count
            },
          ),
        ),

      ],
    );
  }
}
