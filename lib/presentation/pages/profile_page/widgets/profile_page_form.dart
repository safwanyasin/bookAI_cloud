import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/ai_generate/ai_generate_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/ai_generate/widgets/ai_generate_form.dart';
import 'package:book_ai/presentation/reusable_components/buttons/filter_button.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/cards/info_box.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ProfilePageScreen extends StatefulWidget {
  ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  String? apiKey;

  Future<String?> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiKey = prefs.getString('apiKey');
    print('returning $apiKey');
    return apiKey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      height: MediaQuery.of(context).size.height,
      child: BlocProvider<AiGenerateCubit>(
        create: (context) => getIt<AiGenerateCubit>(),
        child: FutureBuilder<void>(
            future: getApiKey(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 130.h),
                      const Heading(content: 'Plot Pilot'),
                      SizedBox(height: 10.h),
                      InfoBox(
                        infoList: [
                          InfoItem(
                              heading: 45.toString(),
                              subheading: 'Reading List Books'),
                          InfoItem(
                              heading: 45.toString(),
                              subheading: 'Wishlist Books')
                        ],
                      ),
                      SizedBox(height: 25.h),
                      apiKey != null
                          ? Column(
                              children: [
                                InputField(
                                  labelText: 'Your Gemini AI API key',
                                  onChanged: (_) {},
                                  validator: (_) {},
                                  hintText: apiKey!,
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FilterButton(
                                      onPressed: () {},
                                      text: 'Update',
                                      active: true,
                                    ),
                                    SizedBox(width: 10.w),
                                    FilterButton(
                                        text: 'Delete',
                                        active: false,
                                        onPressed: () {}),
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  "You haven't added your API key yet. Add your API key to be able to generate stories",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                PrimaryButton(
                                    onPressed: () {
                                      AutoRouter.of(context)
                                          .push(const ApiInputRoute());
                                    },
                                    text: 'Add API Key'),
                              ],
                            )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }),
      ),
      // SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //     SizedBox(height: 95.h),
      //     const Heading(content: 'AI Generate'),
      //     SizedBox(height: 2.h),
      //     const Subheading(
      //       content: 'Generate your own custom story',
      //     ),
      //     SizedBox(height: 10.h),
      //     Text(
      //       'To add multiple values in a parameter, separate each with a comma',
      //       style: Theme.of(context).textTheme.labelSmall,
      //     ),
      //     SizedBox(height: 15.h),
      //     const AiGenerateForm(),
      //   ]),
      // ),
    );
  }
}
