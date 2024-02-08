// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  //final TextEditingController controller;
  final String hintText;
  final String labelText;
  bool obscureText;
  final void Function(String) onChanged;
  final String? Function(String?) validator;
  final bool showError;

  InputField({
    super.key,
    //required this.controller,
    this.hintText = '',
    required this.labelText,
    required this.onChanged,
    required this.validator,
    this.obscureText = false,
    this.showError = false,
  });

  @override
  State<InputField> createState() => _SearchInputState();
}

class _SearchInputState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          widget.labelText,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      SizedBox(
        height: 3.h,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.w),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Theme.of(context).disabledColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextFormField(
                  onChanged: widget.onChanged,
                  obscureText: widget.obscureText,
                  //controller: widget.controller,
                  validator: widget.validator,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.titleMedium),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 3.h,
      ),
      if (widget.validator != null && widget.showError)
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            widget.validator(null) ?? '', // Pass null to get the error message
            style: GoogleFonts.quicksand(
              color: Colors.red,
              fontSize: 12.w,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
    ]);
  }
}
