import 'package:book_ai/presentation/reusable_components/buttons/primary_button.dart';
import 'package:book_ai/presentation/reusable_components/input/dropdown_menu.dart';
import 'package:book_ai/presentation/reusable_components/input/input_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiGenerateForm extends StatelessWidget {
  const AiGenerateForm({super.key});

  @override
  Widget build(BuildContext context) {
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
                  items: ['Male', 'Female', 'Unspecified'],
                  value: 'Unspecified',
                  onChanged: (_) {},
                  validator: (_) {},
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: DropdownMenuInput(
                  labelText: 'Narrative Style',
                  items: ['First Person', 'Second Person', 'Third Person'],
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
  }
}
