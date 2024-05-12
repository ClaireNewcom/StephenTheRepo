import 'package:flutter/material.dart';
import 'package:testingwindows/pages/mainscreen.dart';
import 'package:testingwindows/pages/wearUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(fontFamily: 'TimesNewRoman', scaffoldBackgroundColor: const Color(0xFFF0EBFF)),
      home: const MainScreen(), //use MainScreen to see API call functioning,
      // use const HomePage() to see what we have for the home page so far,
      //We will make these into one home page later
      routes: {
        '/Home' : (context) => const
      MainScreen(),
        '/What Should I wear?' : (context) => const
            wearUI()
      }
    );
  }
}

