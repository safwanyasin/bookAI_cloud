import 'package:auto_route/auto_route.dart';
import 'package:book_ai/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RoutingTestScreen extends StatelessWidget {
  const RoutingTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(AppConstants.appWidth, AppConstants.appHeight));
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).focusColor,
        body: Center(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'enter some shit'),
            )
          ],
        )));
  }
}
