import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_pragma_catbreeds/presentation/screens/home/HomeCats.dart';
import 'package:app_pragma_catbreeds/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomeCats()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilColors.colorSecundario,
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('images/splash_cat.png', height: 200),
          Container(
              height: 220,
              alignment: Alignment.bottomCenter,
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('CatBreeds',
                      textStyle: UtilStylesText.splashTitle,
                      speed: const Duration(milliseconds: 300))
                ],
                totalRepeatCount: 5,
              ))
        ],
      )),
    );
  }
}
