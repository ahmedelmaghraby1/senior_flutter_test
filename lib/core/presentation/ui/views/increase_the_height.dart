import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';
import 'package:senior_flutter_test/core/extensions/translation.dart';

class IncreaseTheHeight extends StatelessWidget {
  const IncreaseTheHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.translations.items,
          style: context.textTheme.titleLarge,
        ),
      ),
    );
  }
}
