import 'package:auto_route/annotations.dart';
import 'package:book_ai/application/search/search_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/search/widgets/search_form.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/input/search_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Set a delay to ensure that the keyboard is shown after the widget is built
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            const AnimatedBackground(),
            SafeArea(
              child: BlocProvider(
                create: (context) => getIt<SearchCubit>(),
                child: SearchForm(focusNode: _focusNode),
              ),
            ),
          ],
        ));
  }
}
