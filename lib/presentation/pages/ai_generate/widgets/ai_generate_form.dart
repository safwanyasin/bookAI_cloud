import 'package:another_flushbar/flushbar.dart';
import 'package:book_ai/application/ai_generate/ai_generate_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/dropdown_menu.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiGenerateForm extends StatelessWidget {
  const AiGenerateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AiGenerateCubit, AiGenerateState>(
      listener: (context, state) {
        state.generateFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  Flushbar(
                    messageText: failure.map(
                      cancelledByUser: (_) => Text('Operation cancelled',
                          style: Theme.of(context).textTheme.titleSmall),
                      serverError: (_) => Text('Server error',
                          style: Theme.of(context).textTheme.titleSmall),
                      otherFailure: (_) => Text('An unexpected error occurred!',
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    barBlur: 20,
                    backgroundColor: Theme.of(context).disabledColor,
                    duration: const Duration(seconds: 2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        topRight: Radius.circular(20.w)),
                  ).show(context);
                }, (_) {
                  // navigate to another page and send the data
                }));
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              InputField(
                labelText: 'Genre',
                hintText: 'Horror, Sci-fi, Fantasy etc.',
                onChanged: (genre) =>
                    context.read<AiGenerateCubit>().updateGender(genre),
                validator: (_) {},
              ),
              SizedBox(height: 10.h),
              InputField(
                labelText: 'Setting',
                hintText: 'Urban, Rural, Outer Space etc.',
                onChanged: (setting) =>
                    context.read<AiGenerateCubit>().updateSetting(setting),
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
                      items: const ['Male', 'Female', 'Unspecified'],
                      value: 'Unspecified',
                      onChanged: (gender) =>
                          context.read<AiGenerateCubit>().updateGender(gender!),
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
                        'Third Person'
                      ],
                      value: 'First Person',
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
                onPressed: () {},
                text: 'Search',
              ),
            ],
          ),
        );
      },
    );
  }
}
