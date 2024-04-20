import 'package:beer_ranking/app/core/enums.dart';
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
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepository())..start(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return const Text('Initial state');
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.success:
              final items = state.items;
              if (items.isEmpty) {
                return const Center(
                  child: Text('Add your first beer'),
                );
              }
              return ListView(
                children: [
                  for (final item in items)
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: _ListItem(item: item),
                    ),
                ],
              );
            case Status.error:
              return Text(state.errorMessage ?? 'Unknown error');
          }
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.item,
  });

  final HomeModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.name),
        Text(item.brewery),
        Text(
          item.rating.toString(),
        ),
      ],
    );
  }
}
