import 'package:book_ai/application/search/search_cubit.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/presentation/pages/search/widgets/search_result_card.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_card.dart';
import 'package:book_ai/presentation/reusable_components/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchForm extends StatefulWidget {
  String initialValue;
  FocusNode focusNode;
  SearchForm({super.key, this.initialValue = '', required this.focusNode});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  List<Book> results = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        state.maybeMap(
          (value) => null,
          searchSuccess: (state) {
            results = state.books;
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              SearchInput(
                focusNode: widget.focusNode,
                hintText: 'Search by title, author, ISBN',
                onChanged: (searchQuery) =>
                    context.read<SearchCubit>().updateSearchQuery(searchQuery),
                onSearchPressed: () => context.read<SearchCubit>().search(),
              ),
              state.maybeMap(
                (value) => Container(),
                initial: (_) => Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Text(
                    'Type to start searching',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                searching: (_) => const Expanded(
                    child: Center(child: CircularProgressIndicator())),
                loading: (_) => const Expanded(
                    child: Center(child: CircularProgressIndicator())),
                searchSuccess: (_) => Expanded(
                  child: results.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: results.length + 1,
                          itemBuilder: ((context, index) {
                            if (index == 0) {
                              return Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Text('Showing ${results.length} results',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              );
                            } else {
                              return SearchResultCard(book: results[index - 1]);
                            }
                            // return Divider();
                          }),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Text(
                            'No results found',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                ),
                searchFailure: (_) => Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Text(
                    'Type to start searching',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                orElse: () => Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}
