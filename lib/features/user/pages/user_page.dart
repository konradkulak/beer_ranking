import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/app/core/injection_container.dart';
import 'package:beer_ranking/features/auth/pages/auth_page.dart';
import 'package:beer_ranking/features/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>(),
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
            return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return BlocProvider.value(
                        value: BlocProvider.of<UserCubit>(context),
                        child: AlertDialog(
                          title: const Text('Delete Account'),
                          content: const Text(
                            'Are you sure you want to permanently delete your account?',
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                context.read<UserCubit>().deleteAccount();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const AuthPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Confirm',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Delete account',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
