import 'package:auto_route/annotations.dart';
import 'package:book_ai/application/wishlist/wishlist_cubit.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_card.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Book> wishlistItems = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WishlistCubit>(),
      child: BlocBuilder<WishlistCubit, WishlistState>(
          //     listener: (context, state) {
          //   state.maybeMap(
          //     loadSuccess: (state) => wishlistItems = state.books,
          //     orElse: () {},
          //   );
          // },
          builder: (context, state) {
        return SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Heading(content: 'Wishlist'),
                SizedBox(height: 2.h),
                state.maybeMap(
                  loadSuccess: (state) {
                    wishlistItems = state.books;
                    return Subheading(
                      content: wishlistItems.length == 1
                          ? 'Showing ${wishlistItems.length} book on your wishlist'
                          : 'Showing ${wishlistItems.length} books on your wishlist',
                    );
                  },
                  orElse: () => Container(),
                ),
                SizedBox(height: 10.h),
                state.maybeMap(
                    loading: (_) => const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    loadSuccess: (_) => Expanded(
                          child: wishlistItems.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: wishlistItems.length,
                                  itemBuilder: ((context, index) {
                                    return InfoCard(
                                      book: wishlistItems[index],
                                      belongsToWishlist: true,
                                    );
                                  }),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: Text(
                                    'Your wishlist is empty. Add some items',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                        ),
                    orElse: () => Container()),
              ],
            ),
          ),
        );
      }),
    );
  }
}
