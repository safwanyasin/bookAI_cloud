import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/pages/home/home_screen.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/routing/navigaton/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  Widget _body = Container();
  final List<Widget> _screens = [
    const HomeScreen(),
    Container(child: Text('screen 2')),
    Container(child: Text('screen 3')),
    Container(child: Text('screen 4')),
    Container(child: Text('screen 5')),
  ];

  @override
  void initState() {
    _body = _screens.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 30.h,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: 20.w),
      //     child: GestureDetector(
      //       child: Icon(
      //         Icons.menu,
      //         size: 25.w,
      //       ),
      //       onTap: () {
      //         print('Menu icon pressed!');
      //       },
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     systemNavigationBarColor: Colors.black, // Navigation bar
      //     statusBarColor: Colors.transparent, // Status bar
      //   ),
      // ),

      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set AppBar background to transparent
        elevation: 0, // Remove AppBar elevation
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            child: Icon(
              Icons.menu,
              size: 25.w,
            ),
            onTap: () {
              print('Menu icon pressed!');
            },
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color.fromARGB(209, 0, 0, 0), Colors.transparent],
            ),
          ),
        ),
      ),

      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const AnimatedBackground(),
          _body,
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (tabIndex) {
          setState(() {
            _body = _screens[tabIndex];
          });
        },
      ),
    );
  }
}
