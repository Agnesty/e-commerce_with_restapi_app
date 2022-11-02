import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ecomerce_store_app/screens/screens_export.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Welcome To",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Agnesty Shop App",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 270,
              height: 270,
              child: LottieBuilder.network(
                "https://assets9.lottiefiles.com/packages/lf20_xqy8h6ej.json",
              ),
            ),
            Text(
              "Hello!",
              style: TextStyle(fontSize: 18),
            ),
          ]),
        ),
      ),
      backgroundColor: Colors.amber,
      nextScreen: OnBoardingScreen(),
      splashIconSize: 400,
      duration: 5000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
