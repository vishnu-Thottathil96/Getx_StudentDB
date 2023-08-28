import 'package:flutter/material.dart';
import 'package:studentdbgetx/view/home/screen_home.dart';

import '../../constants/screen_size.dart';
import '../../constants/space.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.screenHeight = MediaQuery.of(context).size.height;
    ScreenSize.screenWidth = MediaQuery.of(context).size.width;
    splashNavigate(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            kHeight20,
            Text('Loading'),
          ],
        ),
      ),
    );
  }

  void splashNavigate(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
