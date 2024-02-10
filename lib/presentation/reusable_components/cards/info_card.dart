import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/presentation/reusable_components/buttons/remove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  final Book book;

  const InfoCard({super.key, required this.book});

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
        margin: EdgeInsets.all(13.w),
        child: Row(
          children: [
            Stack(
              children: [
                // Image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(13.w),
                  child: Image.network(
                    book.imageUrl.getOrCrash(),
                    width: 105.w,
                    height: 155.h,
                    fit: BoxFit.cover,
                  ),
                ),
                // Cross icon on the top right
                Positioned(
                    top: 8.w,
                    right: 8.h,
                    child: RemoveButton(
                      onPressed: () {},
                    )),
              ],
            ),
            // Details section
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading with two lines
                    Text(
                      book.bookName.getOrCrash(),
                      style: Theme.of(context).textTheme.labelLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    // Subheading on top
                    Text(
                      book.authorName.getOrCrash(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    // Rating and review count
                    Row(
                      children: [
                        // Stars based on rating
                        _buildStarRating(book.rating.getOrCrash()),
                        SizedBox(width: 8.w),
                        // Review count
                        Text(
                            '${book.rating.getOrCrash()} (${book.reviewCount.getOrCrash()})',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    // Subheading on bottom
                    Text('${book.pageCount.getOrCrash()} pages',
                        style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    int filledStars = rating.floor();
    int halfStars = (rating * 2).round() % 2;
    int emptyStars = 5 - filledStars - halfStars;

    return Row(
      children: List.generate(
        filledStars,
        (index) => Icon(
          Icons.star,
          color: Colors.yellow,
          size: 9.5.w,
        ),
      )
        ..addAll(
          List.generate(
            halfStars,
            (index) => Icon(Icons.star_half, color: Colors.yellow, size: 9.5.w),
          ),
        )
        ..addAll(
          List.generate(
            emptyStars,
            (index) =>
                Icon(Icons.star_border, color: Colors.yellow, size: 9.5.w),
          ),
        ),
    );
  }
}
