import 'package:book_ai/application/story/story_watcher/story_watcher_cubit.dart';
import 'package:book_ai/presentation/reusable_components/cards/previous_stories_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSecondaryCarousel extends StatefulWidget {
  const HomeSecondaryCarousel({Key? key}) : super(key: key);

  @override
  State<HomeSecondaryCarousel> createState() => _HomeSecondaryCarouselState();
}

// class _HomeSecondaryCarouselState extends State<HomeSecondaryCarousel> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 140.w,
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: widget.items.length,
//             itemBuilder: ((context, index) {
//               return PreviousStoriesCard(
//                 previousStory: widget.items[index],
//               );
//             })));
//   }
// }

class _HomeSecondaryCarouselState extends State<HomeSecondaryCarousel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryWatcherCubit, StoryWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            return state.story.isNotEmpty
                ? SizedBox(
                    height: 170.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.story.length,
                        itemBuilder: (context, index) {
                          final storyItem = state.story[index];
                          if (storyItem.failureOption.isSome()) {
                            // print('error');
                            // return error card
                            return SizedBox(
                              height: 140.h,
                              child: const Center(
                                child: Text('Unable to load items'),
                                // possible additions: create a try again button
                              ),
                            );
                          } else {
                            return PreviousStoriesCard(
                                previousStory: storyItem);
                          }
                        }),
                  )
                : SizedBox(
                    height: 30.h,
                    child: const Center(
                      child: Text('No stories generated'),
                    ));
          },
          loadFailure: (state) {
            return SizedBox(
              height: 140.h,
              child: const Center(
                child: Text('Unable to load items'),
                // possible additions: create a try again button
              ),
            );
          },
        );
      },
    );
  }
}
