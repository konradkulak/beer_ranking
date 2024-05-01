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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.raleway(
            //AppBar
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.raleway(
            //beer rating (implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          headlineMedium: GoogleFonts.raleway(
            //beer name (implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          headlineSmall: GoogleFonts.raleway(
            //brewery name, beer name(beerpedia) (implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodyLarge: GoogleFonts.raleway(
            //TextField - text & label
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          bodyMedium: GoogleFonts.raleway(
            //general Text
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          bodySmall: GoogleFonts.raleway(
            //beerpedia search result body text
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          labelMedium: GoogleFonts.raleway(
            //TextField hintText (implement manually)
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          elevation: 10,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.brown),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  inherit: true,
                ),
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            elevation: MaterialStateProperty.all(10),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all(
              Colors.brown,
            ),
          ),
        ),
      ),
      home: const AuthPage(),
    );
  }
}
