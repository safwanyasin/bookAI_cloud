import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/presentation/reusable_components/buttons/add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomescreenCard extends StatefulWidget {
  final Book bookDetails;

  const HomescreenCard({super.key, required this.bookDetails});

  @override
  State<HomescreenCard> createState() => _HomescreenCardState();
}

class _HomescreenCardState extends State<HomescreenCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            SizedBox(
              width: 188.w,
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
                            width: 190.w,
                            height: 280.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Like button on the top right
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: CircularHeartButton(
                            liked: widget.bookDetails.liked,
                            onPressed: () {
                              // Handle like button tap
                              setState(() {
                                widget.bookDetails
                                    .copyWithLiked(!widget.bookDetails.liked);
                              });
                              print("Like button tapped!");
                            },
                          ),
                        ),

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
                            ),
                            Text(
                              widget.bookDetails.authorName.getOrCrash(),
                              style: Theme.of(context).textTheme.labelSmall,
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
