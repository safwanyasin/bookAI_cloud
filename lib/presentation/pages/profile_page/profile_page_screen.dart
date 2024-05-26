import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/auth/auth_cubit.dart';
import 'package:book_ai/application/profile_page/profile_page_cubit.dart';
import 'package:book_ai/application/reading_list/reading_list_cubit.dart';
import 'package:book_ai/application/wishlist/wishlist_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/buttons/filter_button.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_box.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  late Future<String?> apiKey;
  String? apiKeyString = '';
  String wishlistCount = '-', readingListCount = '-';

  Future<String?> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiKeyString = prefs.getString('apiKey') ?? '';
    return prefs.getString('apiKey');
  }

  Future<String?> setToEmpty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('apiKey');
    apiKeyString = '';
    return prefs.getString('apiKey');
  }

  // create initstate
  @override
  void initState() {
    super.initState();
    apiKey = getApiKey();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfilePageCubit>(
          create: (context) => getIt<ProfilePageCubit>(),
        ),
        BlocProvider<WishlistCubit>(
          create: (context) => getIt<WishlistCubit>(),
        ),
        BlocProvider<ReadingListCubit>(
          create: (context) => getIt<ReadingListCubit>(),
        ),
      ],
      child: MultiBlocListener(
          listeners: [
            BlocListener<WishlistCubit, WishlistState>(
                listener: (context, state) {
              state.maybeMap(
                  loadSuccess: (state) =>
                      wishlistCount = state.books.length.toString(),
                  orElse: () {});
            }),
            BlocListener<ReadingListCubit, ReadingListState>(
                listener: (context, state) {
              state.maybeMap(
                  loadSuccess: (state) =>
                      readingListCount = state.books.length.toString(),
                  orElse: () {});
            }),
          ],
          child: Stack(
            children: [
              const AnimatedBackground(),
              Container(
                // width: double.infinity,
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                    future: apiKey,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(height: 150.h),
                              Align(
                                alignment: Alignment.center,
                                child: BlocBuilder<AuthCubit, AuthState>(
                                    builder: (context, state) {
                                  // print(state);
                                  return state.maybeMap(authenticated: (value) {
                                    return RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                        text: '@${value.user.nickname.toString()}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ]));
                                  }, orElse: () {
                                    return const Text('Guest');
                                  });
                                }),
                              ),
                              SizedBox(height: 25.h),
                              BlocBuilder<WishlistCubit, WishlistState>(
                                  builder: (context, state) {
                                return state.maybeMap(loadSuccess: (_) {
                                  return BlocBuilder<ReadingListCubit,
                                          ReadingListState>(
                                      builder: (context, state) {
                                    return InfoBox(
                                      infoList: [
                                        InfoItem(
                                            heading: readingListCount,
                                            subheading: 'Reading List Books'),
                                        InfoItem(
                                            heading: wishlistCount,
                                            subheading: 'Wishlist Books')
                                      ],
                                    );
                                  });
                                }, orElse: () {
                                  return InfoBox(
                                    infoList: [
                                      InfoItem(
                                          heading: readingListCount,
                                          subheading: 'Reading List Books'),
                                      InfoItem(
                                          heading: wishlistCount,
                                          subheading: 'Wishlist Books')
                                    ],
                                  );
                                });
                              }),
                              SizedBox(height: 25.h),
                              BlocBuilder<ProfilePageCubit, ProfilePageState>(
                                  builder: (context, state) {
                                return Form(
                                    child: apiKeyString != ''
                                        ? Column(
                                            children: [
                                              InputField(
                                                showError: state.isSubmitting,
                                                labelText:
                                                    'Your Gemini AI API key',
                                                onChanged: (api) => context
                                                    .read<ProfilePageCubit>()
                                                    .updateApiKey(api),
                                                validator: (_) => context
                                                    .read<ProfilePageCubit>()
                                                    .state
                                                    .apiKey
                                                    .value
                                                    .fold(
                                                        (f) => f.maybeMap(
                                                              empty: (_) =>
                                                                  'API key cannot be empty!',
                                                              incorrectLength:
                                                                  (_) {
                                                                return 'Your API key should be 51 characters long';
                                                              },
                                                              orElse: () =>
                                                                  null,
                                                            ),
                                                        (_) => null),
                                                hintText: apiKeyString!,
                                              ),
                                              SizedBox(height: 10.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FilterButton(
                                                    onPressed: () => context
                                                        .read<
                                                            ProfilePageCubit>()
                                                        .update(),
                                                    text: 'Update',
                                                    active: true,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  FilterButton(
                                                      text: 'Delete',
                                                      active: false,
                                                      onPressed: () {
                                                        _showDeleteConfirmationDialog(
                                                            context);
                                                      }),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Text(
                                                "You haven't added your API key yet. Add your API key to be able to generate stories",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                              SizedBox(height: 20.h),
                                              PrimaryButton(
                                                  onPressed: () {
                                                    AutoRouter.of(context).push(
                                                        const ApiInputRoute());
                                                  },
                                                  text: 'Add API Key'),
                                            ],
                                          ));
                              }),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ],
          )),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              title: const Text(
                'Delete API Key?',
              ),
              content:
                  const Text('Are you sure you want to delete your API key?'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    apiKey = setToEmpty();
                    // Perform delete operation here
                    // context.read<ProfilePageCubit>().deleteApiKey();
                  },
                  child: Text('Delete'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Cancel delete operation
                    // context.read<ProfilePageCubit>().cancelDelete();
                  },
                  child: Text('Cancel',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
