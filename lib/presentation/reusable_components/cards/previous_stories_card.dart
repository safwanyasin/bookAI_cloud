import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/infrastructure/story/story_dtos.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviousStoriesCard extends StatelessWidget {
  final StoryItem previousStory;
  const PreviousStoriesCard({Key? key, required this.previousStory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: () {
          final StoryDto storyDto = StoryDto.fromDomain(previousStory);
          AutoRouter.of(context).push(StoryRoute(story: storyDto));
        },
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
                      previousStory.storyTitle.getOrCrash()[0],
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                previousStory.storyTitle.getOrCrash(),
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
