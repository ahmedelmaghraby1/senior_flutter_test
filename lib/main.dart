import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senior_flutter_test/core/source/app.dart';
import 'package:senior_flutter_test/core/source/app_initiallization.dart';

Future<void> main() async {
  await initializeApp();
  runApp(const ProviderScope(child: SeniorFlutterTest()));
}
