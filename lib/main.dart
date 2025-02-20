import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/app.dart';
import 'package:red_line/src/common/config/firebase_options.dart';
import 'package:red_line/src/common/services/firebase_messaging_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseMessagingService firebaseMessagingService =
      FirebaseMessagingService();
  await firebaseMessagingService.initialize();
  await firebaseMessagingService.scheduleNotification(10, 0);
  runApp(App());
}
