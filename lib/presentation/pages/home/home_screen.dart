import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/classes/book.dart';
import 'package:book_ai/presentation/classes/prev_stories.dart';
import 'package:book_ai/presentation/pages/home/home_main_carousel.dart';
import 'package:book_ai/presentation/pages/home/home_secondary_carousel.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button.dart';
import 'package:book_ai/presentation/reusable_components/input/search_input.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/section_heading.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> items = [
    Book(
        author: 'Roald Dahl',
        name: 'Matilda',
        description: 'this book is about a girl named matilda',
        pageCount: 300,
        reviewCount: 5000,
        liked: true,
        imageUrl:
            "http://books.google.com/books/content?id=ggbLDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        onPressed: () {},
        rating: 4.4,
        language: 'English'),
    Book(
        author: 'Adolf Hitler',
        name: 'Mein Kampf',
        description: 'this is the autobiography of Adolf Hitler',
        pageCount: 300,
        reviewCount: 5000,
        liked: false,
        imageUrl:
            "http://books.google.com/books/content?id=B7QkEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        onPressed: () {},
        rating: 4.4,
        language: 'English'),
    Book(
        author: 'Jeff Kinney',
        name: 'Diary of a wimpy kid',
        description: 'this book is about a dumb kid made for dumb kids to read',
        pageCount: 300,
        reviewCount: 5000,
        liked: true,
        imageUrl:
            "http://books.google.com/books/content?id=8MXK_KrHOZYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        onPressed: () {},
        rating: 4.4,
        language: 'English'),
  ];

  List<PreviousStory> previousStoriesList = [
    PreviousStory(
      title: 'The happy prince',
      content: 'This is the description of the story',
      creationDate: DateTime.now(),
    ),
    PreviousStory(
      title: 'Football is great',
      content: 'This is the description of the story',
      creationDate: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 95.h),
            const SectionHeading(
              content: 'Welcome, Safwan',
            ),
            SizedBox(height: 2.h),
            const Heading(
              content: 'What do you want to read today?',
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: SearchInput(
                    controller: TextEditingController(),
                    hintText: 'Search by name, author, ISBN',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () {
                    AutoRouter.of(context).push(const AdvancedSearchRoute());
                  },
                )
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeading(
                  content: 'Top picks for you',
                ),
                PlainButton(
                  onPressed: () {
                    print('See all button pressed');
                  },
                  buttonText: 'See all',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            HomeMainCarousel(items: items),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeading(
                  content: 'Read stories you have generated',
                ),
                PlainButton(
                  onPressed: () async {
                    final dio = Dio();

                    final response = await dio.get(
                        'https://www.googleapis.com/books/v1/volumes?q=mein+kampf');
                    print(response);
                    print(response.runtimeType);
                    print('see all button pressed');
                  },
                  buttonText: 'See all',
                ),
              ],
            ),
            SizedBox(height: 10.h),
            HomeSecondaryCarousel(items: previousStoriesList),
            // SizedBox(height: 10.h),
            // DropdownMenuInput(
            //   labelText: 'Gender',
            //   items: const ['Male', 'Female'],
            //   value: 'male',
            //   onChanged: (_) {},
            //   validator: (_) {},
            // ),
            SizedBox(height: 90.h)
          ],
        ),
      ),
    );
  }
}
