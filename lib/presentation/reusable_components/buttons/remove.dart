import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;

  RemoveButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
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

            // close Icon
            Icon(
              Icons.close,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
