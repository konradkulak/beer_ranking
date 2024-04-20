import 'package:beer_ranking/domain/models/home_model.dart';
import 'package:beer_ranking/domain/repositories/home_repository.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:beer_ranking/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  builder: (context) => const UserProfile(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(HomeRepository())..start(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final items = state.items;

            return ListView(
              children: [
                for (final item in items) ...[
                  Text(item.name),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
