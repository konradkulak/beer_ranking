import 'package:beer_ranking/features/auth/pages/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
            textStyle: const TextStyle(color: Colors.black, fontSize: 24),
          ),
          toolbarTextStyle: GoogleFonts.raleway(
            textStyle: const TextStyle(color: Colors.blue),
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
          labelLarge: GoogleFonts.raleway(
            //ElevatedButton Text
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
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
      ),
      home: const AuthGate(),
    );
  }
}
