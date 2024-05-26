import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/application/book/book_actor/book_actor_cubit.dart';
import 'package:book_ai/application/book/book_watcher/book_watcher_cubit.dart';
import 'package:book_ai/application/story/story_actor/story_actor_cubit.dart';
import 'package:book_ai/application/story/story_watcher/story_watcher_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/home/home_main_carousel.dart';
import 'package:book_ai/presentation/pages/home/home_secondary_carousel.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button.dart';
import 'package:book_ai/presentation/reusable_components/input/search_placeholder.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/section_heading.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StoryWatcherCubit>(
            create: (context) => getIt<StoryWatcherCubit>()),
        BlocProvider<StoryActorCubit>(
            create: (context) => getIt<StoryActorCubit>()),
        BlocProvider<BookWatcherCubit>(
          create: (context) => getIt<BookWatcherCubit>(),
        ),
        BlocProvider<BookActorCubit>(
          create: (context) => getIt<BookActorCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(listener: (context, state) {
            state.maybeMap(
                unauthenticated: (_) => AutoRouter.of(context).replace(
                      const LoginRoute(),
                    ),
                // unverified: (_) => AutoRouter.of(context).replace(
                //       const EmailVerificationRoute(),
                //     ),
                orElse: () {});
          }),
          BlocListener<StoryActorCubit, StoryActorState>(
            listener: (context, state) {
              state.maybeMap(
                  deleteFailure: (state) {
                    Flushbar(
                      messageText: state.storyFailure.map(
                          unexpected: (_) => const Text(
                              'An unexpected error occurred while deleting the story'),
                          insufficientPermissions: (_) {
                            return const Text(
                                'You do not have permssion to carry out this action.');
                          },
                          unableToUpdate: (_) {
                            return const Text('Unable to update.');
                          }),
                      barBlur: 20,
                      backgroundColor: Theme.of(context).disabledColor,
                      duration: const Duration(seconds: 2),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.w),
                          topRight: Radius.circular(20.w)),
                    ).show(context);
                  },
                  orElse: () {});
            },
          )
        ],
        child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 95.h),
                BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                  // print(state);
                  return state.maybeMap(authenticated: (value) {
                    return RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome, ',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      TextSpan(
                        text: value.user.nickname.getOrCrash(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ]));
                  },
                      // unverified: (_) {
                      //   AutoRouter.of(context)
                      //       .replace(const EmailVerificationRoute());
                      //   return const Text('Hi there!');
                      // },
                      orElse: () {
                    return const Text('Hi there!');
                  });
                }),
                SizedBox(height: 2.h),
                const Heading(
                  content: 'What do you want to read today?',
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SearchPlaceholder(
                        onPressed: () =>
                            AutoRouter.of(context).push(SearchRoute()),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune),
                      onPressed: () {
                        AutoRouter.of(context)
                            .push(const AdvancedSearchRoute());
                      },
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHeading(
                      content: "Some books you'd like to read",
                    ),
                    PlainButton(
                      onPressed: () {
                        AutoRouter.of(context).push(const FullWishlistRoute());
                      },
                      buttonText: 'See all',
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const HomeMainCarousel(),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHeading(
                      content: 'Read stories you have generated',
                    ),
                    PlainButton(
                      onPressed: () {
                        AutoRouter.of(context).push(const StoryHistoryRoute());
                        // print('see all button pressed');
                      },
                      buttonText: 'See all',
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const HomeSecondaryCarousel(),
                // SizedBox(height: 10.h),
                // DropdownMenuInput(
                //   labelText: 'Gender',
                //   items: const ['Male', 'Female'],
                //   value: 'male',
                //   onChanged: (_) {},
                //   validator: (_) {},
                // ),
                SizedBox(height: 60.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
