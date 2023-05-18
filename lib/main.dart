import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
            splash:Image.network('https://www.cnpensioners.ca/uploads/1/0/7/8/10783463/news_orig.jpg'),
            duration: 3000,
            splashIconSize: 200.0,
            splashTransition: SplashTransition.scaleTransition,
            nextScreen: MyHome(),
          ),
    );
  }
}


