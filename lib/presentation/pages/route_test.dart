import 'package:auto_route/auto_route.dart';
import 'package:book_ai/constants.dart';
import 'package:book_ai/presentation/reusable_components/buttons/animated_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

@RoutePage()
class RoutingTestScreen extends StatefulWidget {
  const RoutingTestScreen({super.key});

  @override
  State<RoutingTestScreen> createState() => _RoutingTestScreenState();
}

class _RoutingTestScreenState extends State<RoutingTestScreen> {
  ValueNotifier<bool> isActiveNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(AppConstants.appWidth, AppConstants.appHeight));
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'enter some shit'),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: AnimatedBuilder(
                  animation: isActiveNotifier,
                  builder: (context, child) {
                    return AnimatedStars(
                      active: isActiveNotifier.value,
                    );
                  }),
            ),
            TextButton(
                onPressed: () {
                  isActiveNotifier.value = !isActiveNotifier.value;
                },
                child: Text('button'))
          ],
        )));
  }
}
