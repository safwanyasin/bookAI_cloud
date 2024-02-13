import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SearchInput extends StatefulWidget {
  final String hintText;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onPressed;
  final void Function(String) onChanged;
  FocusNode? focusNode;
  SearchInput({
    super.key,
    required this.hintText,
    this.onSearchPressed,
    this.onPressed,
    required this.onChanged,
    this.focusNode,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.transparent, // Adjust the flopacity as needed
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Theme.of(context).disabledColor,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Form(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        focusNode: widget.focusNode,
                        onChanged: widget.onChanged,
                        onTap: widget.onPressed,
                        onFieldSubmitted: (value) => widget.onSearchPressed,
                        decoration: InputDecoration(
                            hintText: widget.hintText,
                            border: InputBorder.none,
                            hintStyle: Theme.of(context).textTheme.titleMedium),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: widget.onSearchPressed,
                  color: Theme.of(context)
                      .primaryColor, // fix issue that it shows as gray
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
