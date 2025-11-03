import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';

class TabletHomeScreen extends StatelessWidget {
  final void Function() onLoad;

  const TabletHomeScreen({super.key, required this.onLoad});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Column(
          children: [
            Text('Home Screen'),
            Container(height: 400.h, width: 400.w, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
