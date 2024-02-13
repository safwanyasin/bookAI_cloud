import 'package:auto_route/annotations.dart';
import 'package:book_ai/application/reading_list/reading_list_cubit.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_card.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ReadingListScreen extends StatefulWidget {
  const ReadingListScreen({super.key});

  @override
  State<ReadingListScreen> createState() => _ReadingListScreenState();
}

class _ReadingListScreenState extends State<ReadingListScreen> {
  List<Book> readingListItems = [];

  @override
  void initState() {
    super.initState();
    print('rendering the reading list');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReadingListCubit>(),
      child: BlocBuilder<ReadingListCubit, ReadingListState>(
          builder: (context, state) {
        print(state);
        return SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Heading(content: 'Reading List'),
                SizedBox(height: 2.h),
                state.maybeMap(
                  loadSuccess: (state) {
                    readingListItems = state.books;
                    print('reading list state map');
                    return Subheading(
                      content: readingListItems.length == 1
                          ? 'Showing ${readingListItems.length} book on your reading list'
                          : 'Showing ${readingListItems.length} books on your reading list',
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
                          child: readingListItems.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: readingListItems.length,
                                  itemBuilder: ((context, index) {
                                    return InfoCard(
                                      book: readingListItems[index],
                                      belongsToWishlist: false,
                                    );
                                  }),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: Text(
                                    'Your reading list is empty. Add some items',
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
