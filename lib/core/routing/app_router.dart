import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:senior_flutter_test/core/routing/app_route_info.dart';
import 'package:senior_flutter_test/core/routing/app_routes.dart';
import 'package:senior_flutter_test/features/home/presentation/screens/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();
  static AppRouter I = AppRouter._();
  List<RouteBase> _getRoutes(List<RouteInfo>? routes) => (routes ?? [])
      .map(
        (subRoute) => GoRoute(
          path: subRoute.path,
          name: subRoute.name ?? subRoute.path,
          builder: (context, state) => subRoute.builder(context, state),
          routes: _getRoutes(subRoute.routes),
        ),
      )
      .toList();

  late final GoRouter _goRouterConfig = GoRouter(
    initialLocation: HomeScreen.path,
    navigatorKey: _rootNavigatorKey,
    routes: _getRoutes(AppRoutes.I.route),
  );
  GoRouter get routerConfig => _goRouterConfig;
}
