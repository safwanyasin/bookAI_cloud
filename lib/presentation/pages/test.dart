import 'package:auto_route/auto_route.dart';
import 'package:book_ai/constants.dart';
import 'package:book_ai/presentation/reusable_components/backgrounds/animatied_background.dart';
import 'package:book_ai/presentation/reusable_components/buttons/filter_button.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/buttons/plain_button.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_box.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_card.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});
  @override
  State<TestingScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestingScreen> {
  late TextEditingController textController;
  final TextEditingController testController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textController =
        TextEditingController(); //Initialised TextEditingController
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(AppConstants.appWidth, AppConstants.appHeight));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Testing page'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //         'assets/images/bg-dark.png'), // Replace with your image path
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Stack(
          children: [
            const AnimatedBackground(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FilterButton(
                          text: "hello", active: false, onPressed: () {}),
                      // FilterButton(text: "hello", active: false, onPressed: () { }),
                      PrimaryButton(
                          text: "hello",
                          onPressed: () {
                            context.router.push(const RoutingTestRoute());
                          }),
                      // SearchInput(
                      //     controller: textController,
                      //     hintText: 'Search for something'),
                      // HomescreenCard(
                      //   imageUrl:
                      //       'https://cdn.kobo.com/book-images/7edc63b3-95a4-42ad-ab61-96135edda145/353/569/90/False/frankenstein-83.jpg',
                      //   heading: 'test',
                      //   subheading: 'subheading',
                      //   liked: false,
                      //   onPressed: () {},
                      // ),
                      // InputField(
                      //   controller: textController,
                      //   hintText: 'enter some shit',
                      //   labelText: 'Genre',
                      // ),
                      InfoCard(
                        imageUrl:
                            'http://books.google.com/books/content?id=B7QkEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                        name: 'Mein Kampf',
                        author: 'Adolf Hitler',
                        rating: 2.5,
                        reviewCount: 300,
                        pageCount: 550,
                        onCrossPressed: () {
                          print('cross button pressed');
                        },
                      ),
                      InfoBox(infoList: [
                        InfoItem(heading: 'Info 1', subheading: 'Subtitle 1'),
                        InfoItem(heading: 'Info 2', subheading: 'Subtitle 2'),
                        InfoItem(heading: 'Info 3', subheading: 'Subtitle 3'),
                      ]),
                      PlainButton(
                          onPressed: () {
                            print('See all button pressed');
                          },
                          buttonText: 'See All'),
                      SizedBox(height: 30.h)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
