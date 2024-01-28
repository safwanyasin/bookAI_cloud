import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularHeartButton extends StatelessWidget {
  final bool liked;
  final VoidCallback onPressed;

  CircularHeartButton({
    required this.liked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Blur
            ClipRRect(
              borderRadius: BorderRadius.circular(15.w),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 30.w,
                  height: 30.w,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),

            // Heart Icon
            Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              color: liked
                  ? Theme.of(context).focusColor
                  : Theme.of(context).primaryColor,
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
