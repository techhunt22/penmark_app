import 'package:coloring_app/constants/color_constants.dart';
import 'package:coloring_app/constants/font_family.dart';
import 'package:coloring_app/constants/font_size.dart';
import 'package:coloring_app/constants/size_constant.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String content;

  const CustomExpansionTile({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  State<CustomExpansionTile>createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.dark,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(color: AppColors.white, fontSize: AppFontSize.bodymedium,fontWeight: AppFonts.regular),
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: const Icon(Icons.keyboard_arrow_down, color:AppColors.white),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: AppColors.transparent),
            child: Text(
              widget.content,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(color: AppColors.white, fontSize: AppFontSize.bodysmall2),
            ),
          )
              : const SizedBox.shrink(), // Collapsed state
        ),
        const SizedBox(height: gap), // Spacing between tiles
      ],
    );
  }
}