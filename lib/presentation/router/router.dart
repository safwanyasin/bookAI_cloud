import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/pages/home/home_page.dart';
import 'package:book_ai/presentation/pages/route_test.dart';
import 'package:book_ai/presentation/pages/test.dart';
// import 'package:book_ai/presentation/router/router.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(page: TestingRoute.page, initial: true),
        AutoRoute(page: RoutingTestRoute.page)
      ];
}
