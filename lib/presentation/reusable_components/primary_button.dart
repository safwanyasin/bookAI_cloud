import 'dart:ui';

import 'package:book_ai/presentation/styles/themes.dart';
import 'package:flutter/material.dart';

// class PrimaryButton extends StatelessWidget {
//   final String text;
//   final bool active;
//   final VoidCallback onPressed;

//   const PrimaryButton(
//       {required this.text, required this.active, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Theme.of(context).focusColor,
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(10.0), // Adjust the radius as needed
//         ),
//       ),
//       child: Text(text),
//     );
//   }
// }

class PrimaryButton extends StatelessWidget {
  final String text;
  bool active = false;
  final VoidCallback onPressed;

  PrimaryButton(
      {required this.text, required this.active, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context)
            .disabledColor, // Set the background color and opacity
        borderRadius:
            BorderRadius.circular(10.0), // Set the border radius as needed
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 10.0, sigmaY: 10.0), // Set the blur amount
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              
              splashFactory: NoSplash.splashFactory,
              backgroundColor: active
                  ? Theme.of(context).primaryColor
                  : Colors
                      .transparent, // Set the button background color to transparent
              elevation: 0, // Remove button shadow
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge, //belLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class frost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration:
                BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
            child: Center(
              child: Text('Frosted',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ),
        ),
      ),
    );
  }
}
