import 'package:auto_route/annotations.dart';
import 'package:book_ai/application/ai_generate/ai_generate_cubit.dart';
import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/pages/ai_generate/widgets/ai_generate_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class AiGenerateScreen extends StatefulWidget {
  AiGenerateScreen({super.key});

  @override
  State<AiGenerateScreen> createState() => _AiGenerateScreenState();
}

class _AiGenerateScreenState extends State<AiGenerateScreen> {
  String? apiKeyString = '';

  late Future<String?> apiKey;

  Future<String?> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiKeyString = prefs.getString('apiKey') ?? '';
    return prefs.getString('apiKey');
  }

  // add init state
  @override
  void initState() {
    super.initState();
    apiKey = getApiKey();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      height: MediaQuery.of(context).size.height,
      child: BlocProvider<AiGenerateCubit>(
        create: (context) => getIt<AiGenerateCubit>(),
        child: FutureBuilder(
            future: apiKey,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return apiKeyString != ''
                    ? AiGenerateForm(keyPresent: true)
                    : AiGenerateForm(keyPresent: false);
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
