import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPlaceholder extends StatefulWidget {
  final VoidCallback? onPressed;

  SearchPlaceholder({
    this.onPressed,
  });

  @override
  State<SearchPlaceholder> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
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
                      // child: Form(
                      //   child: TextFormField(
                      //     onChanged: widget.onChanged,
                      //     onTap: widget.onPressed,
                      //     decoration: InputDecoration(
                      //         hintText: widget.hintText,
                      //         border: InputBorder.none,
                      //         hintStyle: Theme.of(context).textTheme.titleMedium),
                      //   ),
                      // ),
                      child: Container(
                          child: Text(
                        'Search by title, author, ISBN',
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: widget.onPressed,
                    color: Theme.of(context)
                        .primaryColor, // fix issue that it shows as gray
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
