import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoBox extends StatelessWidget {
  final List<InfoItem> infoList;

  const InfoBox({required this.infoList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.w),
        color: Colors.transparent, // Adjust the opacity as needed
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.only(top: 28.h, bottom: 28.h),
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildInfoItems(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInfoItems(BuildContext context) {
    List<Widget> widgets = [];

    for (int i = 0; i < infoList.length; i++) {
      if (i != 0) {
        // Add vertical line separator
        widgets.add(
          Container(
            width: 1.w,
            height: 50.h,
            color: Theme.of(context).disabledColor,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
          ),
        );
      }

      InfoItem infoItem = infoList[i];
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              infoItem.heading,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              infoItem.subheading,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      );
    }

    return widgets;
  }
}

class InfoItem {
  final String heading;
  final String subheading;

  InfoItem({required this.heading, required this.subheading});
}
