import 'package:flutter/material.dart';
import 'package:ecomerce_store_app/consts/colors.dart';
import 'package:ecomerce_store_app/routes/routes.dart';
import 'package:ecomerce_store_app/screens/screens_export.dart';

void main() { 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        primaryColor: lightCardColor,
        backgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: lightIconsColor
          ),
          backgroundColor: lightBackgroundColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold
          ),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: lightIconsColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,
        ), 
        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: lightIconsColor,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}

