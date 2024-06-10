import 'dart:convert';

import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/pages/add_page.dart';
import 'package:beer_ranking/features/beerpedia/pages/beerpedia_page.dart';
import 'package:beer_ranking/features/info/cubit/info_cubit.dart';
import 'package:beer_ranking/features/user/pages/user_page.dart';
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
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                bottom: 30.0,
              ),
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
          _InfoPageBody(beerID: beerID),
        ],
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
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case InfoStatus.error:
              return Center(
                child: Text(state.errorMessage ?? 'No beer data'),
              );
            case InfoStatus.success:
              return _BeerDetails(beer: state.beer!);
            case null:
              return const Center(
                child: Text('No beer data available'),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('beer:'),
                Text(
                  beer.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('brewery:'),
                      Text(
                        beer.brewery,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(),
                ),
                child: Text(
                  beer.rating.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
          _ImageDisplay(
            imageURL: beer.imageURL,
            imageStatus: ImageStatus.valid,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  beer.dateFormatted,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageDisplay extends StatelessWidget {
  const _ImageDisplay({
    required this.imageURL,
    required this.imageStatus,
  });

  final String imageURL;
  final ImageStatus imageStatus;

  @override
  Widget build(BuildContext context) {
    switch (imageStatus) {
      case ImageStatus.missing:
        return _buildEmptyImage();
      case ImageStatus.malformed:
        return _buildErrorImage();
      case ImageStatus.dataURI:
        return _buildDataUriImage(imageURL);
      case ImageStatus.valid:
      default:
        return _buildValidImage(imageURL);
    }
  }
}

Widget _buildEmptyImage() {
  return AspectRatio(
    aspectRatio: 6 / 7,
    child: Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 222, 208),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(
          Icons.photo_camera,
          size: 40,
        ),
      ),
    ),
  );
}

Widget _buildErrorImage() {
  return AspectRatio(
    aspectRatio: 6 / 7,
    child: Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 222, 208),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(child: Text('Image badly formatted')),
    ),
  );
}

Widget _buildDataUriImage(String imageDataUri) {
  final base = base64.decode(imageDataUri.split(',').last);
  return AspectRatio(
    aspectRatio: 6 / 7,
    child: Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.memory(
          base,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget _buildValidImage(String url) {
  return AspectRatio(
    aspectRatio: 6 / 7,
    child: Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          url,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
