import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  double _fontSize = 15.w; // Initial font size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Adjustable Text',
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: _fontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/nav-bg.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.w),
            topRight: Radius.circular(50.w),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.w),
            topRight: Radius.circular(50.w),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            blendMode: BlendMode.srcOver,
            child: Container(
              height: 65.h,
              color: Theme.of(context).disabledColor,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 10.h),
                        child: Text(
                          'Font Size',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                      child: Slider(
                        activeColor: Theme.of(context).focusColor,
                        inactiveColor: Theme.of(context).primaryColor,
                        value: _fontSize,
                        min: 10.w,
                        max: 50.w,
                        onChanged: (value) {
                          setState(() {
                            _fontSize = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
