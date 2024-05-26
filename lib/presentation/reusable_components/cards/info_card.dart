import 'package:auto_route/auto_route.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/infrastructure/book/book_repository.dart';
import 'package:book_ai/presentation/reusable_components/cards/star_rating.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  final Book book;
  final bool belongsToWishlist;

  const InfoCard(
      {super.key, required this.book, required this.belongsToWishlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(13.w)),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Icon(
            Icons.delete,
            color: Theme.of(context).focusColor,
            size: 25.w,
          ),
        ),
        onDismissed: (_) async {
          ApiService _apiService = ApiService();
          BookRepository repo = BookRepository(_apiService);
          await repo.delete(book, belongsToWishlist);
        },
        key: UniqueKey(),
        child: GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(
              BookDetailsRoute(details: book),
            );
            // Navigate to another page when the card is pressed
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AnotherPage(),
            //   ),
            // );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(13.w), // Adjust the value as needed
            ),
            elevation: 0,
            color: Colors.transparent,
            margin: EdgeInsets.all(0),
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
                    // Positioned(
                    //     top: 8.w,
                    //     right: 8.h,
                    //     child: RemoveButton(
                    //       onPressed: () {},
                    //     )),
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
                            buildStarRating(book.rating.getOrCrash(), 9.5.w),
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
        ),
      ),
    );
  }
}
