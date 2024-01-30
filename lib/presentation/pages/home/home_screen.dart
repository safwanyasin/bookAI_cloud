import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/routing/navigaton/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _body = Container();
  final List<Widget> _screens = [
    Container(child: SafeArea(child: Text('screen 1'))),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black, // Navigation bar
          statusBarColor: Colors.transparent, // Status bar
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const AnimatedBackground(),
              _body,
            ],
          )),
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
