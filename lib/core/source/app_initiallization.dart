import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:senior_flutter_test/firebase_options.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ...

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
