import 'package:another_flushbar/flushbar.dart';
import 'package:book_ai/application/search/advanced_search/advanced_search_cubit.dart';
import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/presentation/pages/search/widgets/search_result_card.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/dropdown_menu.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvancedSearchForm extends StatelessWidget {
  AdvancedSearchForm({super.key});
  List<Book> bookList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvancedSearchCubit, AdvancedSearchState>(
        listener: (context, state) {
      state.searchFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            Flushbar(
                messageText: failure.map(
              unexpected: (value) {
                context.read<AdvancedSearchCubit>().reset();
                return Text('An unexpected error occurred',
                    style: Theme.of(context).textTheme.titleSmall);
              },
              unableToUpdate: (value) {
                context.read<AdvancedSearchCubit>().reset();
                return Text('Unable to performt the search',
                    style: Theme.of(context).textTheme.titleSmall);
              },
              insufficientPermissions: (value) {
                context.read<AdvancedSearchCubit>().reset();
                return Text(
                    'You do not have sufficient permissions to perform this action',
                    style: Theme.of(context).textTheme.titleSmall);
              },
              otherFailure: (value) {
                context.read<AdvancedSearchCubit>().reset();
                return Text(value.failureMessage,
                    style: Theme.of(context).textTheme.titleSmall);
              },
            )).show(context);
          },
          (books) {
            bookList = books;
          },
        ),
      );
    }, builder: (context, state) {
      print('hello there ${state.searchFailureOrSuccessOption}');
      if (state.searchFailureOrSuccessOption.isNone()) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: Heading(content: 'Advanced Search'),
              ),
              SizedBox(height: 2.h),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Subheading(
                  content: 'Search with detailed parameters',
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'To add multiple values in a parameter, separate each with a comma',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 15.h),
              Form(
                child: Column(
                  children: [
                    InputField(
                      labelText: 'General Search Term',
                      hintText: 'Any keyword you wish to search for',
                      onChanged: (searchTerm) => context
                          .read<AdvancedSearchCubit>()
                          .updateGeneralSearchTerm(searchTerm),
                      validator: (_) {},
                    ),
                    SizedBox(height: 10.h),
                    InputField(
                      labelText: 'Title',
                      hintText: 'Title of the book',
                      onChanged: (title) => context
                          .read<AdvancedSearchCubit>()
                          .updateTitle(title),
                      validator: (_) {},
                    ),
                    SizedBox(height: 10.h),
                    InputField(
                      labelText: 'Author',
                      hintText: 'Name of the author',
                      onChanged: (author) => context
                          .read<AdvancedSearchCubit>()
                          .updateAuthor(author),
                      validator: (_) {},
                    ),
                    SizedBox(height: 10.h),
                    InputField(
                      labelText: 'Publisher',
                      hintText: 'Publisher of the book',
                      onChanged: (publisher) => context
                          .read<AdvancedSearchCubit>()
                          .updatePublisher(publisher),
                      validator: (_) {},
                    ),
                    SizedBox(height: 10.h),
                    InputField(
                      labelText: 'Category',
                      hintText: 'Category of the book',
                      onChanged: (category) => context
                          .read<AdvancedSearchCubit>()
                          .updateSubject(category),
                      validator: (_) {},
                    ),
                    SizedBox(height: 10.h),
                    InputField(
                      labelText: 'ISBN',
                      hintText: 'ISBN of the book',
                      onChanged: (isbn) =>
                          context.read<AdvancedSearchCubit>().updateIsbn(isbn),
                      validator: (_) {},
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownMenuInput(
                            labelText: 'Print Type',
                            items: const ['All', 'Books', 'Magazines'],
                            value: 'All',
                            onChanged: (printType) => context
                                .read<AdvancedSearchCubit>()
                                .updatePrintType(printType!),
                            validator: (_) {},
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: DropdownMenuInput(
                            labelText: 'Order by',
                            items: const ['None', 'Relevance', 'Publish Date'],
                            value: 'None',
                            onChanged: (orderBy) => context
                                .read<AdvancedSearchCubit>()
                                .updateOrderBy(orderBy!),
                            validator: (_) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    PrimaryButton(
                      onPressed: () {
                        context.read<AdvancedSearchCubit>().search();
                      },
                      text: 'Search',
                    ),
                     SizedBox(height: 15.h)
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return Column(
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Heading(content: 'Advanced Search'),
            ),
            SizedBox(height: 2.h),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Subheading(
                content: 'Search with detailed parameters',
              ),
            ),
            //SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Showing ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: bookList.length.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextSpan(
                  text: ' search result(s)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ])),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: bookList.length,
                itemBuilder: ((context, index) {
                  return SearchResultCard(book: bookList[index]);

                  // return Divider();
                }),
              ),
            ),
             SizedBox(height: 10.h)
          ],
        );
      }
    });
  }
}
