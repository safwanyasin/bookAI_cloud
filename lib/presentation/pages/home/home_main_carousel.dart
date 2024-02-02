import 'package:book_ai/presentation/classes/book.dart';
import 'package:book_ai/presentation/reusable_components/cards/homescreen_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMainCarousel extends StatefulWidget {
  const HomeMainCarousel({Key? key, required this.items}) : super(key: key);

  final List<Book> items;
  @override
  State<HomeMainCarousel> createState() => _HomeMainCarouselState();
}

class _HomeMainCarouselState extends State<HomeMainCarousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 335.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: ((context, index) {
              return HomescreenCard(
                bookDetails: widget.items[index],
              );
            })));
  }
}
