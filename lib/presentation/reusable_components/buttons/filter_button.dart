import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class FilterButton extends StatelessWidget {
  final String text;
  bool active = false;
  final VoidCallback onPressed;

  FilterButton(
      {super.key, required this.text, required this.active, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      enableFeedback: false,
      child: Container(
          // width: MediaQuery.of(context).size.width - 30,
          // height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              color:
                  active ? Theme.of(context).focusColor : Colors.transparent),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6.w),
              child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: active ? 0 : 10, sigmaY: active ? 0 : 10),
                  blendMode: BlendMode.srcOver,
                  child: Container(
                    color: active
                        ? Colors.transparent
                        : Theme.of(context).disabledColor,
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )),
                  )))),
    );
  }
}
