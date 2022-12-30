import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.deepPurple,
        duration: 3000,
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        splash: Image.asset(
          'asset/splash.png',
          alignment: Alignment.center,
        ),
        nextScreen: HomePage());
  }
}
