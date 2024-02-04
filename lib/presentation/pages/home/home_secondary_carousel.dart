import 'package:book_ai/presentation/classes/prev_stories.dart';
import 'package:book_ai/presentation/reusable_components/cards/previous_stories_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSecondaryCarousel extends StatefulWidget {
  const HomeSecondaryCarousel({Key? key, required this.items})
      : super(key: key);

  final List<PreviousStory> items;
  @override
  State<HomeSecondaryCarousel> createState() => _HomeSecondaryCarouselState();
}

class _HomeSecondaryCarouselState extends State<HomeSecondaryCarousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140.w,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: ((context, index) {
              return PreviousStoriesCard(
                previousStory: widget.items[index],
              );
            })));
  }
}
