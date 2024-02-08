import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownMenuInput<T> extends StatefulWidget {
  final String labelText;
  final List<T> items;
  final T? value;
  final void Function(T?) onChanged;
  final String? Function(T?) validator;
  final bool showError;

  const DropdownMenuInput({
    Key? key,
    required this.labelText,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.validator,
    this.showError = false,
  }) : super(key: key);

  @override
  State<DropdownMenuInput<T>> createState() => _DropdownMenuInputState<T>();
}

class _DropdownMenuInputState<T> extends State<DropdownMenuInput<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                  child: DropdownButtonFormField<T>(
                    value: widget.value,
                    items: widget.items.map((item) {
                      return DropdownMenuItem<T>(
                        value: item,
                        child: Text(
                          item.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    }).toList(),
                    onChanged: widget.onChanged,
                    validator: widget.validator,
                    decoration: InputDecoration(
                      hintText: '',
                      border: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                    isExpanded: true,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        if (widget.showError)
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.validator(null) ??
                  '', // Pass null to get the error message
              style: GoogleFonts.quicksand(
                color: Colors.red,
                fontSize: 12.w,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
