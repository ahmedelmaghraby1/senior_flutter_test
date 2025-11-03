import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';
import 'package:senior_flutter_test/core/extensions/translation.dart';

class WebHomeScreen extends StatelessWidget {
  final void Function() onLoad;

  const WebHomeScreen({super.key, required this.onLoad});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Column(
          children: [
            Text(context.translations.items),
            Container(height: 600.h, width: 600.w, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
