import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 3,),
        Text(
          "AGNESTY SHOP",
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFFFF7643),
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 1),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 1),
        LottieBuilder.network(
          image!,
          height: 285,
          width: 255,
        ),
      ],
    );
  }
}