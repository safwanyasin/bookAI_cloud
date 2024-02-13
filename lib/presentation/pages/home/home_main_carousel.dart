import 'package:book_ai/application/book/book_watcher/book_watcher_cubit.dart';
import 'package:book_ai/presentation/reusable_components/cards/homescreen_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMainCarousel extends StatefulWidget {
  const HomeMainCarousel({Key? key}) : super(key: key);

  @override
  State<HomeMainCarousel> createState() => _HomeMainCarouselState();
}

// class _HomeMainCarouselState extends State<HomeMainCarousel> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 335.h,
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: widget.items.length,
//             itemBuilder: ((context, index) {
//               return HomescreenCard(
//                 bookDetails: widget.items[index],
//               );
//             })));
//   }
// }

class _HomeMainCarouselState extends State<HomeMainCarousel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookWatcherCubit, BookWatcherState>(
        builder: (context, state) {
      return state.map(
          initial: (_) => Container(child: Text('init')),
          loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
          loadSuccess: (state) {
            return state.book.isNotEmpty
                ? SizedBox(
                    height: 300.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.book.length,
                      itemBuilder: ((context, index) {
                        final bookItem = state.book[index];
                        if (bookItem.failureOption.isSome()) {
                          print('error');
                          //  return error card
                          return Container();
                        } else {
                          return HomescreenCard(
                            bookDetails: bookItem,
                          );
                        }
                      }),
                    ),
                  )
                : SizedBox(
                    height: 50.h,
                    child: const Center(
                      child: Text(
                          'Add some items to your reading list to receive recommendations'),
                    ));
          },
          loadFailure: (state) {
            return SizedBox(
              height: 140.h,
              child: const Center(
                child: Text('Unable to load items'),
              ),
            );
          });
    });
  }
}
