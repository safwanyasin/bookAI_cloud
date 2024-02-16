import 'package:auto_route/auto_route.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomescreenCard extends StatefulWidget {
  final Book bookDetails;

  const HomescreenCard({super.key, required this.bookDetails});

  @override
  State<HomescreenCard> createState() => _HomescreenCardState();
}

class _HomescreenCardState extends State<HomescreenCard> {
  bool inReadingList = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context)
              .push(BookDetailsRoute(details: widget.bookDetails));
        },
        child: Column(
          children: [
            SizedBox(
              width: 162.w,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                // margin: EdgeInsets.all(16.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Network Image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.w),
                          child: Image.network(
                            widget.bookDetails.imageUrl.getOrCrash(),
                            width: 162.w,
                            height: 238.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // // Like button on the top right
                        // Positioned(
                        //   top: 8.0,
                        //   right: 8.0,
                        //   child: CircularHeartButton(
                        //     liked: true,
                        //     onPressed: () {
                        //       // Handle like button tap
                        //       setState(() {
                        //         context
                        //             .read<BookDetailsCubit>()
                        //             .removeFromWishlist(widget.bookDetails);
                        //       });
                        //       print("Like button tapped!");
                        //     },
                        //   ),
                        // ),

                        // Heading and Subheading
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.bookDetails.bookName.getOrCrash(),
                              style: Theme.of(context).textTheme.labelLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.bookDetails.authorName.getOrCrash(),
                              style: Theme.of(context).textTheme.labelSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
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
