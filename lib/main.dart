import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentdbgetx/controller/db_functions.dart';
import 'package:studentdbgetx/view/splash/screen_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = DB.instance;
  await db.initialiseDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentDB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
