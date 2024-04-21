import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/home_remote_data_source.dart';
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddPage(),
            fullscreenDialog: true,
          ),
        );
        child: const Icon(Icons.add);
      }),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepository(HomeRemoteDataSource()))..start(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.deletionStatus == DeletionStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item deleted successfully'),
              ),
            );
          } else if (state.deletionStatus == DeletionStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error'),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return const Center(
                child: Text('Initial state'),
              );
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.success:
              final items = state.items;
              if (state.status == Status.success && items.isEmpty) {
                return const Center(
                  child: Text('Add your first beer'),
                );
              }
              return ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  for (final item in items)
                    Dismissible(
                      key: ValueKey(item.id),
                      onDismissed: (direction) {
                        context.read<HomeCubit>().deleteItem(item.id);
                      },
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
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(29, 255, 193, 7),
      ),
      child: Column(
        children: [
          Text(item.name),
          Text(item.brewery),
          Text(
            item.rating.toString(),
          ),
        ],
      ),
    );
  }
}
