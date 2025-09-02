import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_design/MyApp/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
  runApp(MyApp());
}
