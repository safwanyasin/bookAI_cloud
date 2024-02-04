import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/pages/login/login.dart';
import 'package:book_ai/presentation/routing/navigaton/nav_screen.dart';
import 'package:book_ai/presentation/pages/route_test.dart';
import 'package:book_ai/presentation/pages/test.dart';
// import 'package:book_ai/presentation/router/router.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: NavRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: TestingRoute.page,
        ),
        AutoRoute(
          page: RoutingTestRoute.page,
        )
      ];
}
