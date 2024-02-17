import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:book_ai/application/ai_generate/ai_generate_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/dropdown_menu.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:book_ai/presentation/reusable_components/loading_indicators/loading_indicator.dart';
import 'package:book_ai/presentation/reusable_components/texts/heading.dart';
import 'package:book_ai/presentation/reusable_components/texts/subheading.dart';
import 'package:book_ai/presentation/routing/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AiGenerateForm extends StatefulWidget {
  bool keyPresent;
  AiGenerateForm({super.key, required this.keyPresent});

  @override
  State<AiGenerateForm> createState() => _AiGenerateFormState();
}

class _AiGenerateFormState extends State<AiGenerateForm> {
  // create init state
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AiGenerateCubit, AiGenerateState>(
      listener: (context, state) {
        state.generateFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  Flushbar(
                    messageText: failure.map(
                      cancelledByUser: (_) {
                        context.read<AiGenerateCubit>().reset();
                        return Text('Operation cancelled',
                            style: Theme.of(context).textTheme.titleSmall);
                      },
                      serverError: (_) {
                        context.read<AiGenerateCubit>().reset();
                        Text('Server error',
                            style: Theme.of(context).textTheme.titleSmall);
                      },
                      otherFailure: (value) {
                        context.read<AiGenerateCubit>().reset();
                        return Text(value.failureMessage,
                            style: Theme.of(context).textTheme.titleSmall);
                      },
                    ),
                    barBlur: 20,
                    backgroundColor: Theme.of(context).disabledColor,
                    duration: const Duration(seconds: 2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        topRight: Radius.circular(20.w)),
                  ).show(context);
                }, (story) {
                  AutoRouter.of(context).push(StoryRoute(story: story));
                  Future.delayed(const Duration(seconds: 1),
                      () => context.read<AiGenerateCubit>().reset());
                }));
      },
      builder: (context, state) {
        print(state.generateFailureOrSuccessOption);
        if (state.generateFailureOrSuccessOption.isNone() &&
            state.isSubmitting == false) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 95.h),
                const Heading(content: 'Plot Pilot'),
                SizedBox(height: 2.h),
                const Subheading(
                  content: 'Generate your own custom story',
                ),
                SizedBox(height: 10.h),
                Text(
                  'To add multiple values in a parameter, separate each with a comma',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 15.h),
                widget.keyPresent
                    ? Form(
                        child: Column(
                          children: [
                            InputField(
                              labelText: 'Genre',
                              hintText: 'Horror, Sci-fi, Fantasy etc.',
                              onChanged: (genre) => context
                                  .read<AiGenerateCubit>()
                                  .updateGender(genre),
                              validator: (_) {},
                            ),
                            SizedBox(height: 10.h),
                            InputField(
                              labelText: 'Setting',
                              hintText: 'Urban, Rural, Outer Space etc.',
                              onChanged: (setting) => context
                                  .read<AiGenerateCubit>()
                                  .updateSetting(setting),
                              validator: (_) {},
                            ),
                            SizedBox(height: 10.h),
                            InputField(
                              labelText: 'Time Period',
                              hintText: 'Future, Medieval, Pre-historic  etc.',
                              onChanged: (timePeriod) => context
                                  .read<AiGenerateCubit>()
                                  .updateTimePeriod(timePeriod),
                              validator: (_) {},
                            ),
                            SizedBox(height: 10.h),
                            InputField(
                              labelText: 'Main Character Traits',
                              hintText: 'Jacked, Nerdy, Flirty etc.',
                              onChanged: (characterTraits) => context
                                  .read<AiGenerateCubit>()
                                  .updateMainCharacterTraits(characterTraits),
                              validator: (_) {},
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownMenuInput(
                                    labelText: 'Gender',
                                    items: const [
                                      'Male',
                                      'Female',
                                      'Unspecified'
                                    ],
                                    value: 'Unspecified',
                                    onChanged: (gender) => context
                                        .read<AiGenerateCubit>()
                                        .updateGender(gender!),
                                    validator: (_) {},
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: DropdownMenuInput(
                                    labelText: 'Narrative Style',
                                    items: const [
                                      'First Person',
                                      'Second Person',
                                      'Third Person',
                                      'Unspecified'
                                    ],
                                    value: 'Unspecified',
                                    onChanged: (style) => context
                                        .read<AiGenerateCubit>()
                                        .updateNarrativeStyle(style!),
                                    validator: (_) {},
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            PrimaryButton(
                              onPressed: () {
                                context.read<AiGenerateCubit>().generate();
                              },
                              text: 'Generate',
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      )
                    : Text(
                        "You haven't added your API key yet. Add your API key to be able to generate stories",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
              ],
            ),
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70.h, child: const LoadingIndicator()),
                Text(
                  'Doing some magic',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          );
        }
        //return Container();
      },
    );
  }
}
