import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';
import 'core/constants/app_strings.dart';

class MenuScanApp extends StatelessWidget {
  const MenuScanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MenuScanApp(),
    );
  }
}
