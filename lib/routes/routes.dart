import 'package:flutter/material.dart';
import 'package:ecomerce_store_app/screens/screens_export.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  OnBoardingScreen.routeName:(context) => const OnBoardingScreen(),
  HomeScreen.routeName:(context) => const HomeScreen(),
  FavoriteScreen.routeName:(context) => const FavoriteScreen(),
  ChatScreen.routeName:(context) => const ChatScreen(),
  FeedsScreen.routeName:(context) => const FeedsScreen(),
  ProfileScreen.routeName:(context) => ProfileScreen(),
};