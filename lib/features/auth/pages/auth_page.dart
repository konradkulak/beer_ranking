import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/data/remote_data_source/auth_remote_data_source.dart';
import 'package:beer_ranking/domain/repositories/auth_repository.dart';
import 'package:beer_ranking/features/auth/cubit/auth_cubit.dart';
import 'package:beer_ranking/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        AuthRepository(
          AuthRemoteDataSource(),
        ),
      ),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.authStatus == AuthStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.authStatus == AuthStatus.success) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
