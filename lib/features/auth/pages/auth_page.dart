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
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            });
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Scaffold(
              body: _AuthPageBody(),
            );
          }
        },
      ),
    );
  }
}

class _AuthPageBody extends StatefulWidget {
  const _AuthPageBody();

  @override
  State<_AuthPageBody> createState() => _AuthPageBodyState();
}

class _AuthPageBodyState extends State<_AuthPageBody> {
  AuthOptions _authOptions = AuthOptions.login;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _authOptions == AuthOptions.login ? 'Sign in' : 'Register',
            ),
            Row(
              children: [
                Text(_authOptions == AuthOptions.login
                    ? "Don't have an account?"
                    : 'Already have an account?'),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _authOptions = _authOptions == AuthOptions.login
                          ? AuthOptions.register
                          : AuthOptions.login;
                    });
                  },
                  child: Text(
                    _authOptions == AuthOptions.login ? 'Register' : 'Sign in',
                  ),
                ),
              ],
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'sample@sample.com',
                hintStyle: Theme.of(context).textTheme.labelMedium,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                if (_authOptions == AuthOptions.login) {
                  context.read<AuthCubit>().signIn(
                        _emailController.text,
                        _passwordController.text,
                      );
                } else {
                  context.read<AuthCubit>().register(
                        _emailController.text,
                        _passwordController.text,
                      );
                }
              },
              child: Text(
                _authOptions == AuthOptions.login ? 'Sign in' : 'Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
