import 'package:auto_route/auto_route.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/presentation/pages/advanced_search/advance_search_screen.dart';
import 'package:book_ai/presentation/pages/book_details/book_details_screen.dart';
import 'package:book_ai/presentation/pages/login/login.dart';
import 'package:book_ai/presentation/pages/reading_list/reading_list_screen.dart';
import 'package:book_ai/presentation/pages/register/register.dart';
import 'package:book_ai/presentation/pages/search/search_screen.dart';
import 'package:book_ai/presentation/routing/navigaton/nav_screen.dart';
import 'package:book_ai/presentation/pages/route_test.dart';
import 'package:book_ai/presentation/pages/test.dart';
import 'package:book_ai/presentation/splash/splash_screen.dart';
import 'package:book_ai/presentation/pages/ai_generate/ai_generate_screen.dart';
import 'package:book_ai/presentation/pages/wishlist/wishlist_screen.dart';
import 'package:flutter/foundation.dart';
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
        CustomRoute(
          page: NavRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 2000,
          // initial: true,
        ),
        AutoRoute(
          page: TestingRoute.page,
        ),
        AutoRoute(
          page: RoutingTestRoute.page,
        ),
        CustomRoute(
          page: AdvancedSearchRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        AutoRoute(
          page: AiGenerateRoute.page,
        ),
        CustomRoute(
          page: SearchRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: WishlistRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: BookDetailsRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: StoryRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
