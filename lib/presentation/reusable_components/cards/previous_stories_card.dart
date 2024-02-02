import 'dart:ui';
import 'package:book_ai/presentation/classes/prev_stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviousStoriesCard extends StatelessWidget {
  final PreviousStory previousStory;

  const PreviousStoriesCard({Key? key, required this.previousStory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          // height: 120.w,
          width: 100.w,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 100.w,
                decoration: const BoxDecoration(
                  // shape: BoxShape.circle,
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
                          width: 100.w,
                          height: 100.w,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
              
                    // initial
                    Text(
                      previousStory.title[0],
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                previousStory.title,
                style: Theme.of(context).textTheme.labelSmall,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
