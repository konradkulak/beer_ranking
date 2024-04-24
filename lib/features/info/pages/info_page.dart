import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/features/add/pages/add_page.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(beer.name),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(beer.brewery),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(beer.rating.toString()),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(beer.dateFormatted()),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(beer.imageURL),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
