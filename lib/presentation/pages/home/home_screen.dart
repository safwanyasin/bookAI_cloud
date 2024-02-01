import 'package:book_ai/presentation/reusable_components/buttons/plain_button.dart';
import 'package:book_ai/presentation/reusable_components/input/search_input.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/section_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            SizedBox(height: 15.h),
            SectionHeading(
              content: 'Welcome, Safwan',
            ),
            SizedBox(height: 2.h),
            Heading(
              content: 'What do you want to read today?',
            ),
            SizedBox(height: 15.h),
            SearchInput(
              controller: TextEditingController(),
              hintText: 'Search by name, author, ISBN',
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
          ],
        ),
      ),
    );
  }
}
