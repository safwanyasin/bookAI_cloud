import 'package:auto_route/annotations.dart';
import 'package:book_ai/application/search/advanced_search/advanced_search_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/search/advanced_search/widgets/advanced_search_form.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AdvancedSearchScreen extends StatelessWidget {
  const AdvancedSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color.fromARGB(209, 0, 0, 0),
                Colors.transparent
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: Container(
              // width: double.infinity,
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              height: MediaQuery.of(context).size.height,
              child: BlocProvider<AdvancedSearchCubit>(
                create: (context) => getIt<AdvancedSearchCubit>(),
                child: AdvancedSearchForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
