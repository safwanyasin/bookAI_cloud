import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            Colors.transparent, // Set AppBar background to transparent
        elevation: 0, // Remove AppBar elevation

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
                    const Heading(content: 'Privacy Policy'),
                    SizedBox(height: 16.h),
                    Text(
                      'Last updated: 17/02/2024',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Introduction:',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'TaleTuner. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this Privacy Policy carefully before using the app.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Information We Collect:',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'We may collect personal information that you provide directly to us, including but not limited to your email address, and other relevant information.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Security:',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'We take reasonable measures to help protect your personal information from unauthorized access, use, or disclosure. Private information such as API keys are saved locally in your device',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Changes to This Privacy Policy:',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'We may update our Privacy Policy from time to time. You are advised to review this Privacy Policy periodically for any changes.',
                      style: Theme.of(context).textTheme.bodyLarge,
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
}
