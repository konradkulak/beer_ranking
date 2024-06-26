import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/app/core/injection_container.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/features/add/pages/add_page.dart';
import 'package:beer_ranking/features/beerpedia/pages/beerpedia_page.dart';
import 'package:beer_ranking/features/home/cubit/home_cubit.dart';
import 'package:beer_ranking/features/info/pages/info_page.dart';
import 'package:beer_ranking/features/user/pages/user_page.dart';
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
                  builder: (context) => const UserPage(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: <Widget>[
          const _HomePageBody(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BeerpediaPage(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: const Text('Beerpedia'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..start(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.deletionStatus == DeletionStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item deleted successfully')),
            );
          } else if (state.deletionStatus == DeletionStatus.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorMessage)),
            );
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return const Center(child: Text('Initial state'));
            case Status.loading:
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: const Center(child: CircularProgressIndicator()),
              );
            case Status.success:
              final items = state.items;
              if (items.isEmpty) {
                return const Center(child: Text('Add your first beer'));
              }
              return ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  for (final item in items)
                    Dismissible(
                      key: ValueKey(item.id),
                      background: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: Icon(Icons.delete),
                          ),
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        return direction == DismissDirection.endToStart;
                      },
                      onDismissed: (direction) {
                        context.read<HomeCubit>().deleteItem(item.id);
                      },
                      child: _ListItem(item: item),
                    ),
                ],
              );
            case Status.error:
              return Center(child: Text(state.errorMessage ?? 'Unknown error'));
          }
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({required this.item});

  final BeerModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InfoPage(beerID: item.id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(183, 245, 203, 51),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(),
                ),
                child: Text(
                  item.rating.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        item.brewery,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
