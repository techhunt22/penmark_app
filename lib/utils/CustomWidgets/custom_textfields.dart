import 'package:coloring_app/constants/responsive.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/font_family.dart';
import '../../constants/font_size.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;

  final String? title;
  final bool titleon;
  final Widget? icon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.title,
    required this.hinttext,
    required this.titleon,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleon
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                    color: AppColors.black,
                  ),
                ),
              )
            : SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          cursorColor: AppColors.black,
          validator: validator,
          style: TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            filled: true,
            hoverColor: AppColors.white,
            fillColor: AppColors.white,
            hintText: hinttext,
            prefixIcon: icon,
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodylarge,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.transparent, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.transparent, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final Widget? icon;
  final String title;
  final bool titleon;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hinttext,
    this.icon,
    required this.title,
    required this.titleon,
  });

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleon
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodymedium,
                    fontWeight: AppFonts.regular,
                    color: AppColors.black,
                  ),
                ),
              )
            : SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.black,
          style: TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: widget.hinttext,
            hoverColor: AppColors.white,
            prefixIcon: widget.icon,
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.transparent, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.transparent, width: 1),
            ),
            suffixIcon: IconButton(
              focusNode: NeverFocusNode(),
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.gray,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
        ),
      ],
    );
  }
}

class NeverFocusNode extends FocusNode {
  @override
  bool get canRequestFocus => false;
}

class CustomTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final String? title;
  final bool titleon;
  final bool suffixon;
  final Widget? icon;
  final Widget? suffixicon;

  const CustomTextField2({
    super.key,
    required this.controller,
    required this.validator,
    this.title,
    required this.hinttext,
    required this.titleon,
    this.icon,
    required this.suffixon, this.suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleon
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: AppFontSize.bodymedium,
              fontWeight: AppFonts.regular,
              color: AppColors.white,            
            ),
          ),
        )
            : SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          cursorColor: AppColors.white,
          validator: validator,
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            filled: true,
            hoverColor: AppColors.dark,
            fillColor: AppColors.dark,
            hintText: hinttext,
            prefixIcon: icon,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            suffixIcon: suffixon == true ? suffixicon : SizedBox.shrink(),
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodylarge,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
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
        ),
      ],
    );
  }
}



class CustomPasswordField2 extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hinttext;
  final Widget? icon;
  final String title;
  final bool titleon;

  const CustomPasswordField2({
    super.key,
    required this.controller,
    required this.validator,
    required this.hinttext,
    this.icon,
    required this.title,
    required this.titleon,
  });

  @override
  CustomPasswordField2State createState() => CustomPasswordField2State();
}

class CustomPasswordField2State extends State<CustomPasswordField2> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleon
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: AppFontSize.bodymedium,
              fontWeight: AppFonts.regular,
              color: AppColors.white,
            ),
          ),
        )
            : SizedBox.shrink(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.white,
          style: TextStyle(
            color: AppColors.white,
            fontSize: AppFontSize.bodylarge,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20),

            filled: true,
            fillColor: AppColors.dark,
            hintText: widget.hinttext,
            hoverColor: AppColors.dark,
            prefixIcon: widget.icon,
            hintStyle: const TextStyle(
              color: AppColors.warmgray,
              fontWeight: AppFonts.regular,
              fontSize: AppFontSize.bodymedium,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
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
            suffixIcon: IconButton(
              focusNode: NeverFocusNode(),
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.gray,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
        ),
      ],
    );
  }
}

class NeverFocusNode2 extends FocusNode {
  @override
  bool get canRequestFocus => false;
}



class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final Widget? icon;
  final Widget suffixicon;

  const SearchField({
    super.key,
    required this.controller,
    required this.hinttext,
    this.icon,
    required this.suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.black,
      style: TextStyle(
        color: AppColors.black,
        fontSize: AppFontSize.bodylarge,
      ),
      decoration: InputDecoration(
        filled: true,
        hoverColor: AppColors.white,
        fillColor: AppColors.white,
        hintText: hinttext,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        suffixIcon:  suffixicon ,
        hintStyle: const TextStyle(
          color: AppColors.warmgray,
          fontWeight: AppFonts.regular,
          fontSize: AppFontSize.bodymedium,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
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
    );
  }
}
