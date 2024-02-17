import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/presentation/pages/ai_generate/ai_generate_screen.dart';
import 'package:book_ai/presentation/pages/home/home_screen.dart';
import 'package:book_ai/presentation/pages/profile_page/profile_page_screen.dart';
import 'package:book_ai/presentation/pages/reading_list/reading_list_screen.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/routing/navigaton/bottom_nav_bar.dart';
import 'package:book_ai/presentation/pages/wishlist/wishlist_screen.dart';
import 'package:book_ai/presentation/routing/navigaton/sidebar_menu.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    const WishlistScreen(),
    AiGenerateScreen(),
    const ReadingListScreen(),
    ProfilePageScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _body = _screens.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      drawer: const SidebarMenu(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:
            Colors.transparent, // Set AppBar background to transparent
        elevation: 0, // Remove AppBar elevation
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            child: Icon(
              Icons.menu,
              size: 25.w,
            ),
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        actions: [
          _body == _screens[2]
              ? Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: IconButton(
                    icon: Icon(Icons.history, size: 25.w),
                    onPressed: () {
                      AutoRouter.of(context).push(const StoryHistoryRoute());
                    },
                  ),
                )
              : _body == _screens[4]
                  ? BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        state.maybeMap(
                            unauthenticated: (_) =>
                                AutoRouter.of(context).popAndPush(
                                  const LoginRoute(),
                                ),
                            orElse: () {});
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: IconButton(
                          icon: Icon(Icons.logout, size: 25.w),
                          onPressed: () {
                            context.read<AuthCubit>().signedOut();
                          },
                        ),
                      ),
                    )
                  : Container(),
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
