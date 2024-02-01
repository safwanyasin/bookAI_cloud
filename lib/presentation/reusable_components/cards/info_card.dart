import 'package:book_ai/presentation/reusable_components/buttons/remove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String author;
  final double rating;
  final int reviewCount;
  final int pageCount;
  final VoidCallback onCrossPressed;

  const InfoCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.author,
    required this.rating,
    required this.reviewCount,
    required this.pageCount,
    required this.onCrossPressed,
  });

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
                    imageUrl,
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
                      onPressed: onCrossPressed,
                    )),
              ],
            ),
            // Details section
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading with two lines
                  Text(
                    name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  // Subheading on top
                  Text(
                    author,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  // Rating and review count
                  Row(
                    children: [
                      // Stars based on rating
                      _buildStarRating(rating),
                      SizedBox(width: 8.w),
                      // Review count
                      Text(
                        '$rating ($reviewCount)',
                        style: Theme.of(context).textTheme.labelSmall
                      ),
                    ],
                  ),
                  // Subheading on bottom
                  Text(
                    '$pageCount pages',
                    style: Theme.of(context).textTheme.labelSmall
                  ),
                ],
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
