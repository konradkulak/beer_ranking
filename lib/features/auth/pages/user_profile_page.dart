import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providers: [
        EmailAuthProvider(),
      ],
      actions: [
        SignedOutAction(
          (context) {
            Navigator.of(context).pop();
          },
        ),
      ],
      avatarSize: 150,
    );
  }
}
