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
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AboutScreen(),
      );
    },
    AdvancedSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdvancedSearchScreen(),
      );
    },
    AiGenerateRoute.name: (routeData) {
      final args = routeData.argsAs<AiGenerateRouteArgs>(
          orElse: () => const AiGenerateRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AiGenerateScreen(key: args.key),
      );
    },
    ApiInputRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApiInputScreen(),
      );
    },
    BookDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BookDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookDetailsScreen(
          key: args.key,
          details: args.details,
        ),
      );
    },
    FullWishlistRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FullWishlistScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    NavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrivacyPolicyScreen(),
      );
    },
    ProfileRouteRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteRouteArgs>(
          orElse: () => const ProfileRouteRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePageScreen(key: args.key),
      );
    },
    ReadingListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReadingListScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    RoutingTestRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RoutingTestScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StoryHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoryHistoryScreen(),
      );
    },
    StoryRoute.name: (routeData) {
      final args = routeData.argsAs<StoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StoryScreen(
          key: args.key,
          story: args.story,
        ),
      );
    },
    TestingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TestingScreen(),
      );
    },
    WishlistRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WishlistScreen(),
      );
    },
  };
}

/// generated route for
/// [AboutScreen]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdvancedSearchScreen]
class AdvancedSearchRoute extends PageRouteInfo<void> {
  const AdvancedSearchRoute({List<PageRouteInfo>? children})
      : super(
          AdvancedSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdvancedSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AiGenerateScreen]
class AiGenerateRoute extends PageRouteInfo<AiGenerateRouteArgs> {
  AiGenerateRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AiGenerateRoute.name,
          args: AiGenerateRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AiGenerateRoute';

  static const PageInfo<AiGenerateRouteArgs> page =
      PageInfo<AiGenerateRouteArgs>(name);
}

class AiGenerateRouteArgs {
  const AiGenerateRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AiGenerateRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ApiInputScreen]
class ApiInputRoute extends PageRouteInfo<void> {
  const ApiInputRoute({List<PageRouteInfo>? children})
      : super(
          ApiInputRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiInputRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookDetailsScreen]
class BookDetailsRoute extends PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    Key? key,
    required Book details,
    List<PageRouteInfo>? children,
  }) : super(
          BookDetailsRoute.name,
          args: BookDetailsRouteArgs(
            key: key,
            details: details,
          ),
          initialChildren: children,
        );

  static const String name = 'BookDetailsRoute';

  static const PageInfo<BookDetailsRouteArgs> page =
      PageInfo<BookDetailsRouteArgs>(name);
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({
    this.key,
    required this.details,
  });

  final Key? key;

  final Book details;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, details: $details}';
  }
}

/// generated route for
/// [FullWishlistScreen]
class FullWishlistRoute extends PageRouteInfo<void> {
  const FullWishlistRoute({List<PageRouteInfo>? children})
      : super(
          FullWishlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'FullWishlistRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePageScreen]
class ProfileRouteRoute extends PageRouteInfo<ProfileRouteRouteArgs> {
  ProfileRouteRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRouteRoute.name,
          args: ProfileRouteRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRouteRoute';

  static const PageInfo<ProfileRouteRouteArgs> page =
      PageInfo<ProfileRouteRouteArgs>(name);
}

class ProfileRouteRouteArgs {
  const ProfileRouteRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfileRouteRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ReadingListScreen]
class ReadingListRoute extends PageRouteInfo<void> {
  const ReadingListRoute({List<PageRouteInfo>? children})
      : super(
          ReadingListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReadingListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

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
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoryHistoryScreen]
class StoryHistoryRoute extends PageRouteInfo<void> {
  const StoryHistoryRoute({List<PageRouteInfo>? children})
      : super(
          StoryHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoryHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoryScreen]
class StoryRoute extends PageRouteInfo<StoryRouteArgs> {
  StoryRoute({
    Key? key,
    required StoryDto story,
    List<PageRouteInfo>? children,
  }) : super(
          StoryRoute.name,
          args: StoryRouteArgs(
            key: key,
            story: story,
          ),
          initialChildren: children,
        );

  static const String name = 'StoryRoute';

  static const PageInfo<StoryRouteArgs> page = PageInfo<StoryRouteArgs>(name);
}

class StoryRouteArgs {
  const StoryRouteArgs({
    this.key,
    required this.story,
  });

  final Key? key;

  final StoryDto story;

  @override
  String toString() {
    return 'StoryRouteArgs{key: $key, story: $story}';
  }
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

/// generated route for
/// [WishlistScreen]
class WishlistRoute extends PageRouteInfo<void> {
  const WishlistRoute({List<PageRouteInfo>? children})
      : super(
          WishlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
