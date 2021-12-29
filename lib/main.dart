import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const HomePage(),
    );
  }
}
