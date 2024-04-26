import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/beerpedia_remote_data_source.dart';
import 'package:beer_ranking/domain/repositories/beerpedia_repository.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:beer_ranking/features/beerpedia/cubit/beerpedia_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerpediaPage extends StatelessWidget {
  const BeerpediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeerpediaCubit(
        BeerpediaRepository(
          BeerpediaRemoteDataSource(),
        ),
      ),
      child: BlocConsumer<BeerpediaCubit, BeerpediaState>(
        listener: (context, state) {
          if (state.beerpediaStatus == BeerpediaStatus.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.beerpediaStatus == BeerpediaStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final beerpediaModel = state.beerpediaModel;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Beerpedia'),
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
            body: Column(children: [
              if (beerpediaModel != null) const Beerpedia(),
              const Text('s')
            ],)
          );
        },
      ),
    );
  }
}

class Beerpedia extends StatelessWidget {
  const Beerpedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('d');
  }
}
