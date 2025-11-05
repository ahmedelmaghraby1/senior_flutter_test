import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double? height;
  const CustomVerticalDivider({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 22,
      width: 0.5,
      color: context.appColor.containerColor,
    );
  }
}

class CustomDivider extends StatelessWidget {
  final double? width;
  const CustomDivider({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: width ?? double.infinity,
      color: context.appColor.containerColor,
    );
  }
}
