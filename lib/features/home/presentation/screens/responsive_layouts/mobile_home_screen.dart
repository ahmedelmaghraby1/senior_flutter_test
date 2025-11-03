import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';

class MobileHomeScreen extends StatelessWidget {
  final void Function() onLoad;
  const MobileHomeScreen({super.key, required this.onLoad});

  @override
  Widget build(BuildContext context) {
    onLoad();
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Column(
          children: [
            Text('Home Screen'),
            Container(height: 200.h, width: 200.w, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
