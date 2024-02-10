import 'package:book_ai/domain/book/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultCard extends StatelessWidget {
  final Book book;

  const SearchResultCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to another page when the card is pressed
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => AnotherPage(),
        //   ),
        // );
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 7.h, bottom: 7.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.w),
              child: Image.network(
                book.imageUrl.getOrCrash(),
                width: 35.w,
                height: 52.h,
                fit: BoxFit.cover,
              ),
            ),
            // Details section
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading with two lines
                    Text(
                      book.bookName.getOrCrash(),
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    // Subheading on top
                    Text(
                      book.authorName.getOrCrash(),
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
