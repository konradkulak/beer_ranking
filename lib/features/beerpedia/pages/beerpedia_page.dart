import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/beerpedia_remote_data_source.dart';
import 'package:beer_ranking/domain/models/beerpedia_model.dart';
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
            body: Column(
              children: [
                if (beerpediaModel != null)
                  _BeerpediaContent(
                    beerpediaModel: beerpediaModel,
                  ),
                _BeerpediaSearch()
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BeerpediaContent extends StatelessWidget {
  const _BeerpediaContent({
    required this.beerpediaModel,
  });

  final BeerpediaModel beerpediaModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeerpediaCubit, BeerpediaState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(beerpediaModel.title),
            Text(beerpediaModel.alcohol),
            Text(beerpediaModel.description),
            Text(beerpediaModel.country),
          ],
        );
      },
    );
  }
}

class _BeerpediaSearch extends StatelessWidget {
  _BeerpediaSearch();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Enter beer name',
            hintText: 'Spring',
            hintStyle: Theme.of(context).textTheme.labelMedium,
            border: const OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read<BeerpediaCubit>()
                .getBeerpediaModel(title: _controller.text);
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}
