import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  bool obscureText;
  final void Function(String) onChanged;
  final void Function(String) validator;

  InputField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    this.obscureText = false,
  });

  @override
  State<InputField> createState() => _SearchInputState();
}

class _SearchInputState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            style: Theme.of(context).textTheme.labelSmall,
            widget.labelText,
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
                  child: Form(
                    child: TextFormField(
                      onChanged: widget.onChanged,
                      obscureText: widget.obscureText,
                      controller: widget.controller,
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
        ),
      ],
    );
  }
}
