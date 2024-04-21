import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:beer_ranking/features/add/cubit/add_cubit.dart';
import 'package:beer_ranking/features/auth/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocBuilder<AddCubit, AddState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add Your Beer'),
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
            body: const _AddPageBody(),
          );
        },
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          TextField(),
        ],
      ),
    );
  }
}
