import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';
import 'package:senior_flutter_test/core/languages/app_languages.dart';
import 'package:senior_flutter_test/core/routing/app_router.dart';
import 'package:senior_flutter_test/core/services/screen_utils.dart';

class SeniorFlutterTest extends StatelessWidget {
  const SeniorFlutterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.I.routerConfig,
        locale: const Locale('en'),
        supportedLocales: Languages.supportedLocales,
        localizationsDelegates: Languages.localizationsDelegates,
        themeMode: ThemeMode.dark,
        theme: Theme.of(
          context,
        ).appTheme(Brightness.dark).getThemeData(context),
      ),
    );
  }
}
