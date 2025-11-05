import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: width ?? 4,
        color: context.appColor.secondaryColor,
      ),
    );
  }
}
