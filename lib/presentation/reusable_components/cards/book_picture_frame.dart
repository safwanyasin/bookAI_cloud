import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookPictureFrame extends StatelessWidget {
  final String imageUrl;

  const BookPictureFrame({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.w),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(15.w),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.w),
              child: Image.network(
                imageUrl,
                width: 162.w,
                height: 238.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
