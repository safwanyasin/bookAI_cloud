import 'package:auto_route/auto_route.dart';
import 'package:book_ai/presentation/pages/advanced_search/advance_search_screen.dart';
import 'package:book_ai/presentation/pages/login/login.dart';
import 'package:book_ai/presentation/pages/register/register.dart';
import 'package:book_ai/presentation/routing/navigaton/nav_screen.dart';
import 'package:book_ai/presentation/pages/route_test.dart';
import 'package:book_ai/presentation/pages/test.dart';
import 'package:book_ai/presentation/splash/splash_screen.dart';
import 'package:book_ai/presentation/pages/ai_generate/ai_generate_screen.dart';
// import 'package:book_ai/presentation/router/router.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
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
        ),
        AutoRoute(
          page: AdvancedSearchRoute.page,
        ),
        AutoRoute(
          page: AiGenerateRoute.page,
        )
      ];
}
