import 'package:auto_route/auto_route.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/infrastructure/story/story_dtos.dart';
import 'package:book_ai/presentation/pages/about/about_screen.dart';
import 'package:book_ai/presentation/pages/email_verification/email_verification_screen.dart';
import 'package:book_ai/presentation/pages/profile_page/profile_page_screen.dart';
import 'package:book_ai/presentation/pages/search/advanced_search/advanced_search_screen.dart';
import 'package:book_ai/presentation/pages/api_input_screen/api_input_screen.dart';
import 'package:book_ai/presentation/pages/book_details/book_details_screen.dart';
import 'package:book_ai/presentation/pages/login/login.dart';
import 'package:book_ai/presentation/pages/reading_list/reading_list_screen.dart';
import 'package:book_ai/presentation/pages/register/register.dart';
import 'package:book_ai/presentation/pages/search/search_screen.dart';
import 'package:book_ai/presentation/pages/wishlist/wishlist_sceen_full.dart';
import 'package:book_ai/presentation/pages/privacy_policy/privacy_policy_screen.dart';
import 'package:book_ai/presentation/routing/navigaton/nav_screen.dart';
import 'package:book_ai/presentation/pages/route_test.dart';
import 'package:book_ai/presentation/pages/test.dart';
import 'package:book_ai/presentation/pages/splash/splash_screen.dart';
import 'package:book_ai/presentation/pages/ai_generate/ai_generate_screen.dart';
import 'package:book_ai/presentation/pages/wishlist/wishlist_screen.dart';
import 'package:book_ai/presentation/pages/story/story_screen.dart';
import 'package:book_ai/presentation/pages/story_history/story_history_screen.dart';
import 'package:flutter/foundation.dart';
// import 'package:book_ai/presentation/router/router.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
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
          durationInMilliseconds: 1000,
        ),
        CustomRoute(
          page: ApiInputRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: StoryHistoryRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: FullWishlistRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: PrivacyPolicyRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: AboutRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: EmailVerificationRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        )
      ];
}
