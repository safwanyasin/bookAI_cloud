import 'package:book_ai/presentation/reusable_components/buttons/add_to_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomescreenCard extends StatelessWidget {
  final String imageUrl;
  final String heading;
  final String subheading;
  final bool liked;
  final VoidCallback onPressed;

  HomescreenCard({
    required this.imageUrl,
    required this.heading,
    required this.subheading,
    required this.liked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
            width: 188.w,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.all(16.w),
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
                          imageUrl,
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
                          liked: liked,
                          onPressed: () {
                            // Handle like button tap
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
                            heading,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            subheading,
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
    );
  }
}
