import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ecomerce_store_app/screens/screens_export.dart';
import 'package:ecomerce_store_app/widgets/widget_export.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  
  static String routeName = "/onboarding";
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> onBoardingData = [
    {
      "text": "Welcome to Agnesty, Let’s shop!",
      "image": "https://assets3.lottiefiles.com/packages/lf20_h7ofe9pc.json"
    },
    {
      "text":
          "We help people conect with store \naround Indonesia",
      "image": "https://assets3.lottiefiles.com/packages/lf20_pm5qdb4j.json"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "https://assets3.lottiefiles.com/packages/lf20_5tkzkblw.json"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onBoardingData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: onBoardingData[index]["image"],
                    text: onBoardingData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: "Continue",
                        press: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFFF7643) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
  

