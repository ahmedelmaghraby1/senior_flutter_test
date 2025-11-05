import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/enums/responsive_enum.dart';

extension Responsive on BuildContext {
  ResponsiveUI get responsiveUI {
    if ((MediaQuery.sizeOf(this).height < 100)) {
      return ResponsiveUI.abnormal;
    } else {
      if (MediaQuery.sizeOf(this).width > 1024) {
        return ResponsiveUI.web;
      } else if (MediaQuery.sizeOf(this).width > 600 &&
          MediaQuery.sizeOf(this).width < 1024) {
        return ResponsiveUI.tablet;
      } else {
        return ResponsiveUI.mobile;
      }
    }
  }
}
