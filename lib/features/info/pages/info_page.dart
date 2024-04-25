import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/pages/add_page.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:beer_ranking/features/info/cubit/info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
    required this.beerID,
  });

  final String beerID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beer label'),
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
      body: _InfoPageBody(beerID: beerID),
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
  const _InfoPageBody({required this.beerID});

  final String beerID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InfoCubit(BeerRepository(BeerRemoteDataSource()))..getBeerID(beerID),
      child: BlocBuilder<InfoCubit, InfoState>(
        builder: (context, state) {
          switch (state.infoStatus) {
            case InfoStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case InfoStatus.error:
              return Center(
                child: Text(state.errorMessage ?? 'No beer data'),
              );
            case InfoStatus.success:
              return _BeerDetails(beer: state.beer!);
            case null:
              return const Center(
                child: Text('No beer data avaiable'),
              );
          }
        },
      ),
    );
  }
}

class _BeerDetails extends StatelessWidget {
  const _BeerDetails({
    required this.beer,
  });

  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                beer.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                beer.brewery,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  beer.rating.toString(),
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(beer.dateFormatted()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Image.network(beer.imageURL),
              ),
            )
          ],
        ),
      ),
    );
  }
}
