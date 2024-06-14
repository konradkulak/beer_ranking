import 'package:beer_ranking/app/core/enums.dart';
import 'package:beer_ranking/app/core/injection_container.dart';
import 'package:beer_ranking/domain/models/beerpedia_model.dart';
import 'package:beer_ranking/features/beerpedia/cubit/beerpedia_cubit.dart';
import 'package:beer_ranking/features/user/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerpediaPage extends StatelessWidget {
  const BeerpediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BeerpediaCubit>(),
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
            return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Beerpedia'),
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
            body: _BeerpediaContent(beerpediaModel: state.beerpediaModel),
          );
        },
      ),
    );
  }
}

class _BeerpediaContent extends StatelessWidget {
  _BeerpediaContent({
    required this.beerpediaModel,
  });

  final BeerpediaModel? beerpediaModel;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeerpediaCubit, BeerpediaState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const Text('Beer:'),
              Text(
                beerpediaModel?.title ?? '',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10.0),
              const Text('Alcohol content:'),
              Text(
                beerpediaModel?.alcohol ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10.0),
              const Text('About:'),
              Text(
                beerpediaModel?.formattedDescription ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10.0),
              const Text('Brewed in:'),
              Text(
                beerpediaModel?.capitalizedCountry ?? '',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _controller,
                onChanged: (text) {
                  context.read<BeerpediaCubit>().updateButtonState(text);
                },
                decoration: InputDecoration(
                  labelText: 'Enter beer name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Having troubles finding a beer you like? Try Weiss',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: state.isButtonEnabled
                    ? () {
                        context
                            .read<BeerpediaCubit>()
                            .getBeerpediaModel(title: _controller.text);
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (!state.isButtonEnabled) {
                        return Colors.brown.withOpacity(0.5);
                      }
                      return Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.backgroundColor
                              ?.resolve(states) ??
                          Colors.brown;
                    },
                  ),
                ),
                child: const Text('Search'),
              ),
            ],
          ),
        );
      },
    );
  }
}
