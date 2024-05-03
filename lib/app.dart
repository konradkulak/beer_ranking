import 'package:beer_ranking/features/auth/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Beer Ranking',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 222, 208),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: Color.fromARGB(255, 242, 222, 208),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 242, 222, 208),
          titleTextStyle: GoogleFonts.raleway(
            //AppBar
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.raleway(
            //beer rating (implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          headlineMedium: GoogleFonts.raleway(
            //beer name, AuthPage title (implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          headlineSmall: GoogleFonts.raleway(
            //brewery name, beer name(beerpedia)-(implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyLarge: GoogleFonts.raleway(
            //TextField - text & label
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          bodyMedium: GoogleFonts.raleway(
            //general Text
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          bodySmall: GoogleFonts.raleway(
            //beerpedia search result body text
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          labelSmall: GoogleFonts.raleway(
            //TextField comment BeerpediaPage (implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          elevation: 10.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.brown),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  inherit: true,
                ),
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            elevation: MaterialStateProperty.all(10.0),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all(
              Colors.brown,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.all(Colors.brown),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                  inherit: true,
                ),
              ),
            ),
          ),
        ),
      ),
      home: const AuthPage(),
    );
  }
}
