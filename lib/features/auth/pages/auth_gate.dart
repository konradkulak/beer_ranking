import 'package:beer_ranking/features/home/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart'
    as firebase_ui; // dodatkowy alias jeśli jest konflikt nazw

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Konfiguracja ekranu logowania używająca SignInScreen z firebase_ui_auth
          return firebase_ui.SignInScreen(
            auth: FirebaseAuth.instance,
            providers: [
              firebase_ui.EmailAuthProvider(),
            ],
          );
        }

        return const HomePage();
      },
    );
  }
}
