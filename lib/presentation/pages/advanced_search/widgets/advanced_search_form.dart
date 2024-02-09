import 'package:book_ai/application/advanced_search/advanced_search_cubit.dart';
import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/dropdown_menu.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvancedSearchForm extends StatelessWidget {
  const AdvancedSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvancedSearchCubit, AdvancedSearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                InputField(
                  labelText: 'Genre',
                  hintText: 'Horror, Sci-fi, Fantasy etc.',
                  onChanged: (_) {},
                  validator: (_) {},
                ),
                SizedBox(height: 10.h),
                InputField(
                  labelText: 'Setting',
                  hintText: 'Urban, Rural, Outer Space etc.',
                  onChanged: (_) {},
                  validator: (_) {},
                ),
                SizedBox(height: 10.h),
                InputField(
                  labelText: 'Setting',
                  hintText: 'Future, Medieval, Pre-historic  etc.',
                  onChanged: (_) {},
                  validator: (_) {},
                ),
                SizedBox(height: 10.h),
                InputField(
                  labelText: 'Main Character Traits',
                  hintText: 'Jacked, Nerdy, Flirty etc.',
                  onChanged: (_) {},
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
                        onChanged: (_) {},
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
                        onChanged: (_) {},
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
        });
  }
}
