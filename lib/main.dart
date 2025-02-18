import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:red_line/firebase_options.dart';
import 'package:red_line/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}
