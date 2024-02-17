import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Heading(content: 'TaleTuner'),
                    SizedBox(height: 16.h),
                    Text(
                      'Version: 1.0.0',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Description:',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'TaleTuner allows you to keep track of the books you have read and manage your wishlist. It integrates with Gemini AI for story generation and Google Books API for getting book information.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Acknowledgments',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Special gratitude to Gemini AI and Google Books API for providing the amazing services that make this app possible.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Developed By:',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'M Safwan Yasin',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _launchUrl(
                              'https://www.linkedin.com/in/safwanyasin'),
                          child: Image.asset('assets/images/linkedin.png', width: 20.w),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                          onTap: () =>
                              _launchUrl('https://www.github.com/safwanyasin'),
                          child: Image.asset('assets/images/github.png', width: 20.w,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri);
    }catch (e) {
      throw 'Could not launch $url';
    }
  }
}
