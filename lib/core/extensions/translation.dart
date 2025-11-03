import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/languages/app_languages.dart';

extension Translation on BuildContext {
  Languages get translations => Languages.of(this)!;
}
