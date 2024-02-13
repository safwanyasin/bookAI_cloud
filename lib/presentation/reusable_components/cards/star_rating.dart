import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildStarRating(double rating, double size) {
  int filledStars = rating.floor();
  int halfStars = (rating * 2).round() % 2;
  int emptyStars = 5 - filledStars - halfStars;

  return Row(
    children: List.generate(
      filledStars,
      (index) => Icon(
        Icons.star,
        color: Colors.yellow,
        size: size,
      ),
    )
      ..addAll(
        List.generate(
          halfStars,
          (index) => Icon(Icons.star_half, color: Colors.yellow, size: size),
        ),
      )
      ..addAll(
        List.generate(
          emptyStars,
          (index) => Icon(Icons.star_border, color: Colors.yellow, size: size),
        ),
      ),
  );
}
