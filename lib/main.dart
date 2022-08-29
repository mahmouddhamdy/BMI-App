import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.lato(
            fontSize: 35,
            color: Colors.white,
          ),
          headline2: GoogleFonts.lato(
            fontSize: 33,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: GoogleFonts.lato(
            fontSize: 35,
            color: Colors.white,
          ),
          bodyText2: GoogleFonts.lato(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        appBarTheme:
            const AppBarTheme(centerTitle: true, backgroundColor: Colors.teal),
      ),
      home: const MyHomePage(),
    );
  }
}
