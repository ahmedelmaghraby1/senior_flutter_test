import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:senior_flutter_test/core/routing/app_route_info.dart';
import 'package:senior_flutter_test/features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  AppRoutes._();
  static AppRoutes I = AppRoutes._();
  final List<RouteInfo> route = [
    RouteInfo(
      path: HomeScreen.path,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
  ];
}
