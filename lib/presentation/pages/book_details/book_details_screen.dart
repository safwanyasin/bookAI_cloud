import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/book_details/book_details_cubit.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/cards/book_picture_frame.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_box.dart';
import 'package:book_ai/presentation/reusable_components/cards/star_rating.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class BookDetailsScreen extends StatefulWidget {
  Book details;
  BookDetailsScreen({super.key, required this.details});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookDetailsCubit, BookDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  Colors.transparent, // Set AppBar background to transparent
              elevation: 0, // Remove AppBar elevation

              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: IconButton(
                    icon: Icon(Icons.favorite, size: 25.w),
                    onPressed: () {
                      print('like button pressed');
                    },
                  ),
                ),
              ],
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Color.fromARGB(209, 0, 0, 0),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                const AnimatedBackground(),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SafeArea(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 15.h),
                                Align(
                                    alignment: Alignment.center,
                                    child: BookPictureFrame(
                                        imageUrl: widget.details.imageUrl
                                            .getOrCrash())),
                                SizedBox(height: 10.h),
                                Heading(
                                    content:
                                        widget.details.bookName.getOrCrash()),
                                SizedBox(height: 2.h),
                                Subheading(
                                    content:
                                        widget.details.authorName.getOrCrash()),
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildStarRating(
                                        widget.details.rating.getOrCrash(),
                                        14.w),
                                    SizedBox(width: 5.w),
                                    Text(
                                        '${widget.details.rating.getOrCrash()} (${widget.details.reviewCount.getOrCrash()})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall)
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                InfoBox(infoList: [
                                  InfoItem(
                                    heading: widget.details.pageCount
                                        .getOrCrash()
                                        .toString(),
                                    subheading: 'Pages',
                                  ),
                                  InfoItem(
                                    heading:
                                        widget.details.language.getOrCrash(),
                                    subheading: 'Language',
                                  ),
                                  InfoItem(
                                    heading:
                                        widget.details.publishDate.getOrCrash(),
                                    subheading: 'Published',
                                  )
                                ]),
                                SizedBox(height: 15.h),
                                const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Heading(content: 'Overview')),
                                SizedBox(height: 2.h),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Publisher: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    TextSpan(
                                      text:
                                          widget.details.publisher.getOrCrash(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ])),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Categories: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    TextSpan(
                                      text:
                                          widget.details.category.getOrCrash(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ])),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Description: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    TextSpan(
                                        text: widget.details.description
                                            .getOrCrash(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall)
                                  ])),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      PrimaryButton(
                          onPressed: () {}, text: 'Add to reading list'),
                      SizedBox(height: 5.h)
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
