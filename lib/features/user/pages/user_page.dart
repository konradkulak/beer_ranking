import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/auth_remote_data_source.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:beer_ranking/features/auth/pages/auth_page.dart';
import 'package:beer_ranking/features/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(
        AuthRepository(
          AuthRemoteDataSource(),
        ),
      ),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state.userStatus == UserStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Unknown error'),
              ),
            );
          } else if (state.userStatus == UserStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Operation successful'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.userStatus == UserStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('User Profile'),
            ),
            body: const _UserPageBody(),
          );
        },
      ),
    );
  }
}

class _UserPageBody extends StatelessWidget {
  const _UserPageBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AuthPage(),
                ),
              );
              context.read<UserCubit>().signOut();
            },
            child: const Text('Sign out'),
          ),
          ElevatedButton(
            onPressed: () {
              AlertDialog(
                title: const Text('Delete Account'),
                content: const Text(
                  'Are you sure you want to permanently delete your account?',
                ),
                actions: <Widget>[
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.read<UserCubit>().deleteAccount();
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                ],
              );
            },
            child: const Text('Delete account'),
          ),
        ],
      ),
    );
  }
}
