import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/enums/responsive_enum.dart';
import 'package:senior_flutter_test/core/extensions/responsive.dart';
import 'package:senior_flutter_test/core/presentation/ui/views/increase_the_height.dart';
import 'package:senior_flutter_test/features/home/presentation/screens/responsive_layouts/mobile_home_screen.dart';
import 'package:senior_flutter_test/features/home/presentation/screens/responsive_layouts/tablet_home_screen.dart';
import 'package:senior_flutter_test/features/home/presentation/screens/responsive_layouts/web_home_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onLoad() {
    log('${context.responsiveUI}');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return context.responsiveUI == ResponsiveUI.abnormal
            ? IncreaseTheHeight()
            : context.responsiveUI == ResponsiveUI.mobile
            ? MobileHomeScreen()
            : context.responsiveUI == ResponsiveUI.web
            ? WebHomeScreen()
            : TabletHomeScreen();
      },
    );
  }
}
