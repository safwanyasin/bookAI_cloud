import 'package:book_ai/injection.dart';
import 'package:book_ai/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  configureInjection(Environment.prod);

  runApp(AppWidget());
}
