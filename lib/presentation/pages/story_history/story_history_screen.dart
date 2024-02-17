import 'package:auto_route/annotations.dart';
import 'package:book_ai/application/story_history/story_history_cubit.dart';
import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/story_history/widgets/story_history_item.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class StoryHistoryScreen extends StatefulWidget {
  const StoryHistoryScreen({super.key});

  @override
  State<StoryHistoryScreen> createState() => _StoryHistoryScreenState();
}

class _StoryHistoryScreenState extends State<StoryHistoryScreen> {
  List<StoryItem> storyHistoryItem = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StoryHistoryCubit>(),
      child: BlocBuilder<StoryHistoryCubit, StoryHistoryState>(
          //     listener: (context, state) {
          //   state.maybeMap(
          //     loadSuccess: (state) => wishlistItems = state.books,
          //     orElse: () {},
          //   );
          // },
          builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor:
                Colors.transparent, // Set AppBar background to transparent
            elevation: 0, // Remove AppBar elevation

            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Color.fromARGB(209, 0, 0, 0),
                    Colors.transparent
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              const AnimatedBackground(),
              SafeArea(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Heading(content: 'Plot Pilot History'),
                      SizedBox(height: 2.h),
                      state.maybeMap(
                        loadSuccess: (state) {
                          storyHistoryItem = state.stories;
                          return Subheading(
                            content: storyHistoryItem.length == 1
                                ? 'Showing ${storyHistoryItem.length} story you generated using Plot Pilot'
                                : 'Showing ${storyHistoryItem.length} stories you have generated using Plot Pilot',
                          );
                        },
                        orElse: () => Container(),
                      ),
                      SizedBox(height: 10.h),
                      state.maybeMap(
                          loading: (_) => const Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          loadSuccess: (_) => Expanded(
                                child: storyHistoryItem.isNotEmpty
                                    ? ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: storyHistoryItem.length,
                                        itemBuilder: ((context, index) {
                                          return StoryHistoryItem(
                                              story: storyHistoryItem[index],
                                              onDelete: () {
                                                context
                                                    .read<StoryHistoryCubit>()
                                                    .deleteStory(
                                                        storyHistoryItem[
                                                            index]);
                                              });
                                        }),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(top: 15.h),
                                        child: Text(
                                          'No stories to show',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ),
                              ),
                          orElse: () => Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
