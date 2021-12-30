import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FocalCulator",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      // theme: NeumorphicThemeData(
      //   baseColor: Color(0xFFFFFFFF),
      //   lightSource: LightSource.topLeft,
      //   depth: 10,
      // ),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: const Text(
            "F O O D S M A S H",
            style: TextStyle(fontSize: 20),
          ),
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
          backgroundColor: Colors.white),
    );
  }
}
