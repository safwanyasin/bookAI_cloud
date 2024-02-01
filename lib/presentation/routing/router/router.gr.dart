// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    NavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavScreen(),
      );
    },
    RoutingTestRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RoutingTestScreen(),
      );
    },
    TestingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TestingScreen(),
      );
    },
  };
}

/// generated route for
/// [NavScreen]
class NavRoute extends PageRouteInfo<void> {
  const NavRoute({List<PageRouteInfo>? children})
      : super(
          NavRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoutingTestScreen]
class RoutingTestRoute extends PageRouteInfo<void> {
  const RoutingTestRoute({List<PageRouteInfo>? children})
      : super(
          RoutingTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutingTestRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TestingScreen]
class TestingRoute extends PageRouteInfo<void> {
  const TestingRoute({List<PageRouteInfo>? children})
      : super(
          TestingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
