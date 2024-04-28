import 'dart:convert';

import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/beer_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/domain/repositories/beer_repository.dart';
import 'package:beer_ranking/features/add/pages/add_page.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:beer_ranking/features/beerpedia/pages/beerpedia_page.dart';
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
    ImageStatus imageStatus =
        context.select((InfoCubit cubit) => cubit.state.imageStatus);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              beer.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              beer.brewery,
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  beer.rating.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            _ImageDisplay(
              imageURL: beer.imageURL,
              imageStatus: imageStatus,
            ),
            Text(
              beer.dateFormatted(),
            ),
          ],
        ),
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
    ImageStatus imageStatus =
        context.select((InfoCubit cubit) => cubit.state.imageStatus);

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
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
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
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
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
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.memory(
          base,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _buildValidImage(String url) {
  return AspectRatio(
    aspectRatio: 6 / 7,
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
