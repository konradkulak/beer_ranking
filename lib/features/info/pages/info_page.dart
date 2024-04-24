import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/pages/add_page.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:beer_ranking/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key, required this.beer});

  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beer.name),
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
      body: _InfoPageBody(beer: beer),
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
    );
  }
}

class _InfoPageBody extends StatelessWidget {
  const _InfoPageBody({required this.beer});

  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return Text(beer.name);
  }
}
