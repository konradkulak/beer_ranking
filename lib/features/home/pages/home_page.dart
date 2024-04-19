import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Beer Ranking'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const UserProfile()),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
