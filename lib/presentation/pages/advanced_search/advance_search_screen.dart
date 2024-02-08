import 'package:auto_route/annotations.dart';
import 'package:book_ai/presentation/pages/advanced_search/widgets/advanced_search_form.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AdvancedSearchScreen extends StatelessWidget {
  const AdvancedSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Heading(content: 'Advanced Search'),
                  ),
                  SizedBox(height: 2.h),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Subheading(
                      content: 'Search with detailed parameters',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'To add multiple values in a parameter, separate each with a comma',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: 15.h),
                  const AdvancedSearchForm(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
