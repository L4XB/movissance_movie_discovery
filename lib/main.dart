import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/app.dart';
import 'package:red_line/src/common/config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
  //
}
